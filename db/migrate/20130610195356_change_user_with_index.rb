class ChangeUserWithIndex < ActiveRecord::Migration
  def change
    add_column :users, :total_karma, :integer
    add_index :users, :total_karma
  end
end
