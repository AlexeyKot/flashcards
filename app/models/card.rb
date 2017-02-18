class Card < ApplicationRecord
	belongs_to :user
	validates :original_text, presence: true, uniqueness: true, length: { minimum: 2 }
	validates :translated_text, presence: true, length: { minimum: 2 }
	validate :same_words?

	scope :expired, -> { where('review_date <= ?', Date.today) }
	scope :random, -> { order('RANDOM()') }

	before_create do
		self.review_date = Date.today
	end


	def move_review_date
		self.review_date = Date.today + 3.days
		self.save
	end

	def check_translation(answer)
		answer.to_s.strip.downcase == self.original_text.to_s.strip.downcase
	end

	private
	def same_words?
		if (self.original_text.to_s.strip.downcase == self.translated_text.to_s.strip.downcase)
			errors.add(:original_text, "слова должны отличаться")
		end
	end
end
