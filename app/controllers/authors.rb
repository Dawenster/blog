get '/create/author' do

	erb :create_author
end

post '/new/author' do
	author = Author.create(params[:author])
	puts author.id
	puts session.inspect
	session[:current_user_id] = author.id
	puts session[:current_user_id]
end

get '/author/login' do
	current_user = Author.authenticate(params[:login])
	if current_user
		session[:current_user_id] = current_user.id
		erb :index
	else
		erb :create_author
	end
end