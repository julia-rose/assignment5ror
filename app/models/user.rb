class User < ActiveRecord::Base
	has_many :posts
	validates :fname, presence: true
	validates :lname, presence: true
	validates :email, presence: true
	validates :password, presence: true
end
