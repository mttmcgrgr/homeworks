class RemoveColumn < ActiveRecord::Migration
  def self.up
    remove_column :users, :email, :string
  end
end
