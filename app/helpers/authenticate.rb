def get_current_user(id)
	Author.find(id) if id
end