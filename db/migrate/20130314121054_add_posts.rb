class AddPosts < ActiveRecord::Migration
  def change
  	create_table :AddPosts do |t|
  		t.string :title, :null => false
  		t.text :content, :null => false
  		t.references :author
  		t.timestamps
		end
  end
end
