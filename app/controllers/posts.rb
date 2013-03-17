get '/create/post' do
	erb :create_post
end

post '/new/post' do
	params[:post][:author_id] = session[:id]
	@post = Post.create(params[:post])
	entered_tags = params[:tag][:name].split(',')
	p entered_tags
	entered_tags.each do |tag|
		@post.tags << Tag.find_or_create_by_name(tag)
	end
	redirect '/'
end

get '/post/:id' do
	@post = Post.find(params[:id])
	@author_name = Author.find(@post.author_id).name
	erb :single_post
end