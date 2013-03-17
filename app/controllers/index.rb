before do
	@current_user = get_current_user(session[:id])
	@posts = Post.all
end

get '/' do
  erb :index
end


