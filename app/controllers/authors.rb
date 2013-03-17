get '/create/author' do
	erb :create_author
end

post '/new/author' do
	new_author = Author.new(params[:author])
	new_author.save
	session[:id] = new_author.id
	redirect '/'
end

post '/author/login' do
	current_user = Author.authenticate(params[:login])
	if current_user
		session[:id] = current_user.id
		erb :index
	else
		redirect '/create/author'
	end
end

get '/author/logout' do
	session.delete(:id)
	erb :index
end