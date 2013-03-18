get '/create/author' do
	erb :create_author
end

post '/new/author' do
	new_author = Author.new(params[:author])
	if new_author.save
		new_author.save
		session[:id] = new_author.id
	redirect '/'
	else
		@errors = new_author.errors.full_messages
		erb :create_author
	end
end

post '/author/login' do
	current_user = Author.authenticate(params[:login])
	if current_user
		session[:id] = current_user.id
		erb :index
	else
		@errors = ['Woah there - wrong email or password.  Try again!']
		erb :dedicated_login
	end
end

get '/author/logout' do
	session.delete(:id)
	erb :index
end