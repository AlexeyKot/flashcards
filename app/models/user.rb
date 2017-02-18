class User < ApplicationRecord
  has_many :cards
  validates :email, presence: true, uniqueness: true, length: { minimum: 8 }
  validates :password, presence: true, length: { minimum: 8 }
end
