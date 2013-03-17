get '/create/author' do
	erb :create_author
end

post '/new/author' do
	new_author = Author.create(params[:author])
	session[:id] = new_author.id
	redirect '/'
end

post '/author/login' do
	current_user = Author.authenticate(params[:login])
	if current_user
		session[:id] = current_user.id
		p "hello!"
		erb :index
	else
		erb :create_author
	end
end

get '/author/logout' do
	session.delete(:id)
	erb :index
end