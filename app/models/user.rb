class User < ApplicationRecord
  #devise :database_authenticatable,
   #      :recoverable, :rememberable, :validatable
  has_many :recipes
  validates :login, :password, :email, presence: true
  validates :login, uniqueness: true
end