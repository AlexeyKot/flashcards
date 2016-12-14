class Card < ApplicationRecord
    validates :original_text, presence: true, uniqueness: true, length: { minumum: 2 }
    validates :original_text, presence: true, length: { minumum: 2 }
    validates :review_date, presence: true
end
