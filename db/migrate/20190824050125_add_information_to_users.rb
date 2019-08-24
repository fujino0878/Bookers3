class AddInformationToUsers < ActiveRecord::Migration[5.1]
  def change
     add_column :users,:introduction,:string
    remove_column :users,:info,:string
  end
end
