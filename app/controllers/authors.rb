get '/create/author' do
	erb :create_author
end

post '/new/author' do
	new_author = Author.create(params[:author])
	session[:current_user_id] = new_author.id
end

get '/author/login' do
	current_user = Author.authenticate(params[:login])
	if current_user
		session[:current_user_id] = current_user.id
		@posts = Post.all
		erb :index
	else
		erb :create_author
	end
end

get '/author/logout' do
	session.delete(:current_user_id)
	@posts = Post.all
	erb :index
end