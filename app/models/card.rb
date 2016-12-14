class Card < ApplicationRecord
    validates :original_text, presence: true, uniqueness: true, length: { minimum: 2 }
    validates :translated_text, presence: true, length: { minimum: 2 }
    validates :review_date, presence: true
end
