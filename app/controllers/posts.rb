get '/create/post' do
	erb :create_post
end

post '/new/post' do
	login_user
	params[:post][:author_id] = session[:current_user_id]
	Post.create(params[:post])
end

get '/post/:id' do
	@post = Post.find(params[:id])
	@author_name = Author.find(@post.author_id).name
	erb :single_post
end