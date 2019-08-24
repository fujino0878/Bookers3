class RemoveNameAndAddIndexOfEmailToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :Users,:email
    remove_column :Users, :name, :string
  end
end
