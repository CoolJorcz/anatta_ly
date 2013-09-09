class AddPointsToItem < ActiveRecord::Migration
  def change
    add_column :items, :points, :integer
  end
end
