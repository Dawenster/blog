class CreateLinktables < ActiveRecord::Migration
  def change
  	create_table :linktables do |t|
  		t.references :post
  		t.references :tag
  		t.timestamps
  	end
  end
end
