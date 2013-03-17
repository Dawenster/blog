class Post < ActiveRecord::Base
	has_many :tags, :through => :linktables
	has_many :linktables
	belongs_to :author
end
