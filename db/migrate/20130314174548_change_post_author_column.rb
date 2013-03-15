class ChangePostAuthorColumn < ActiveRecord::Migration
  def change
  	change_column :posts, :author_id, :integer
  end
end
