require 'bcrypt'

class Author < ActiveRecord::Base
	# attr_reader :entered_password

	before_create :set_password

	has_many :posts

	validates :email, :uniqueness => true
	validates :email, :format => { :with => 
		/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/
	}

	include BCrypt

	def set_password
    self.password_hash = Password.create(self.password_hash)
  end

  def self.authenticate(params)
		@current_user = Author.find_by_email(params[:email])
		if @current_user && BCrypt::Password.new(@current_user.password_hash) == params[:password]
			puts "I'm inside!"
			return @current_user
    end
    false
	end
end
