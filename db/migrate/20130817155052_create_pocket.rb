class CreatePocket < ActiveRecord::Migration
  def up
  	create_table :pockets do |t|
  		t.string :user
  		t.string :token
  		t.timestamps	
  	end 
  end

  def down
  	drop_table :users
  end
end
