class Tag < ActiveRecord::Base
	has_many :posts, :through => :linktables
	has_many :linktables

	validates :name, :uniqueness => true
end
