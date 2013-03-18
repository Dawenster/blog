class Linktable < ActiveRecord::Base
	belongs_to :post
	belongs_to :tag
end
