helpers do
	def login_user
		@current_user_id = session[:current_user_id]
	end
end