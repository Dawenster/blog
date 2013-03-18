Author.create(:name => "David Wen", :email => "david@gmail.com", :password_hash => "asdf")
Post.create(:title => "Test title", :content => "Test content", :author_id => 1)