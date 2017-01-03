# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'mechanize'

agent = Mechanize.new
page = agent.get("http://www.languagedaily.com/learn-german/vocabulary/common-german-words")
counter = 0
crawl_links = page.links_with(href: /german-words/)
crawl_links.map do |link|
	link.click.search('.jsn-article-content tbody tr[class^="row"]').each do |a|
		# Look for words in table and remove unnecessary space symbol in empty cells 
		english_word = a.search('td[3]').text.gsub(160.chr("UTF-8"),"") 
		german_word = a.search('td[2]').text.gsub(160.chr("UTF-8"),"")
		if !english_word.to_s.empty?
			Card.create(original_text: german_word, translated_text: english_word)
			counter+=1
		end
	end
end

if counter > 0
	puts "Added " + counter.to_s + " records to database"
else
	puts "Something went wrong or nothing to add to database"
end