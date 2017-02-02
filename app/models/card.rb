class Card < ApplicationRecord
	validates :original_text, presence: true, uniqueness: true, length: { minimum: 2 }
	validates :translated_text, presence: true, length: { minimum: 2 }
	validate :same_words?

	scope :expired, -> { where('review_date <= ?', Date.today) }
	scope :random, -> { order('RANDOM()') }

	before_create do
		self.review_date = Date.today
	end


	def add_to_review_date(number)
		self.review_date = Date.today + number.days
	end

	private
	def same_words?
		if (self.original_text.to_s.strip.downcase == self.translated_text.to_s.strip.downcase)
			errors.add(:original_text, "слова должны отличаться")
		end
	end
end