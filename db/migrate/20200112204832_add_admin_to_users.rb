class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :admin, :boolean, defulte: false
  end
end
