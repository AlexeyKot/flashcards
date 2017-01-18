class Card < ApplicationRecord
	validates :original_text, presence: true, uniqueness: true, length: { minimum: 2 }
	validates :translated_text, presence: true, length: { minimum: 2 }
	validate :original_not_equal_to_translated?

	scope :expired, -> { where('review_date <= ?', DateTime.current) }
	scope :random, -> { order("RANDOM()").first }

	before_create do
		self.review_date = Date.today+3.day
	end

	def set_review_date(i)
		self.review_date = Date.today + i.days
	end

	private
	def original_not_equal_to_translated?
		if (self.original_text.strip.downcase == self.translated_text.strip.downcase)
			errors.add(:original_text, "слово не может быть одинаковым с переводом")
			errors.add(:translated_text, "перевод не может быть таким же как слово")
		end
	end
end