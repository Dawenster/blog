class Author < ActiveRecord::Base
	has_many :posts

	validates :email, :uniqueness => true
	validates :email, :format => { :with => 
		/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/
	}

	def self.authenticate(params)
		current_user = Author.find_by_email(params[:email])
		#Check password stuff
		current_user
	end
end
