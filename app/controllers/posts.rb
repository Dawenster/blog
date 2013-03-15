get '/create/post' do
	erb :create_post
end

post '/new/post' do
	login_user
	params[:post][:author_id] = session[:current_user_id]
	Post.create(params[:post])
end