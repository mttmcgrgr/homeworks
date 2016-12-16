class ChangeColumns < ActiveRecord::Migration
  def change
    change_column :users, :username, null: false

  def change
    change_column :users :username, :string, null: false
  end
end
