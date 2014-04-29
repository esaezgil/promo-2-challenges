require_relative 'email_validator'

class User < ActiveRecord::Base
  has_many :posts
  validates_associated :posts
  validates :name, presence: true
  validates :email, uniqueness: true, email: true
end