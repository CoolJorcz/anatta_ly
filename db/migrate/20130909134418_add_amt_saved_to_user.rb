class AddAmtSavedToUser < ActiveRecord::Migration
  def change
    add_column :users, :amt_borrowed, :integer, default: 0
    add_column :users, :amt_shared, :integer, default: 0
    add_column :users, :points, :integer, default: 10
  end
end
