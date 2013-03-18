get '/create/post' do
	erb :create_post
end

post '/new/post' do
	params[:post][:author_id] = session[:id]
	@post = Post.create(params[:post])
	entered_tags = params[:tag][:name].split(',')
	p entered_tags
	entered_tags.each do |tag|
		@post.tags << Tag.find_or_create_by_name(tag.strip)
	end
	redirect '/'
end

get '/post/:id' do
	@post = Post.find(params[:id])
	@author_name = Author.find(@post.author_id).name
	erb :single_post
end

put '/post/:id' do
	@post = Post.find(params[:id])
	@post.update_attributes(params[:post])
	redirect "/post/#{@post.id}"
end

get '/post/:id/edit' do
	@post = Post.find(params[:id])
	erb :edit_post
end

delete '/post/:id/delete' do
	@post = Post.find(params[:id])
	Post.destroy(@post.id)
	redirect '/'
end
