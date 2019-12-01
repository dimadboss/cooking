class User < ApplicationRecord

  has_many :recipes
  validates :login, :password, :email, presence: true
end