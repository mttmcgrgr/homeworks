class CreateVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.timestamps
      t.string 'shortened_url_id', null: false
      t.string 'user_id', null: false
    end

    add_index :visits, :shortened_url_id
    add_index :visits, :user_id
  end
end
