get '/create/post' do
	erb :create_post
end

post '/new/post' do
	params[:post][:author_id] = session[:id]
	post = Post.create(params[:post])
	entered_tags = []
	@created_tags = []
	entered_tags = params[:tag][:name].split(',')
	p entered_tags

	entered_tags.each do |tag|
		@created_tags = Tag.create(:name => tag)
	end
	p @created_tags
	post.tags = @created_tags
end

get '/post/:id' do
	@post = Post.find(params[:id])
	@author_name = Author.find(@post.author_id).name
	erb :single_post
end