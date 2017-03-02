class User < ApplicationRecord
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, dependent: :destroy
  has_many :cards, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }, confirmation: true
  validates :email, length: { minimum: 8 }, uniqueness: true, email_format: { message: 'has invalid format' }
end
