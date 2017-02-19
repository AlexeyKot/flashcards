class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }, confirmation: true
  validates :email, length: { minimum: 8 }, uniqueness: true, email_format: { message: 'has invalid format' }
end
