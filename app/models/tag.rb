class Tag < ActiveRecord::Base
	has_many :posts

	validates :name, :uniqueness => true
end
