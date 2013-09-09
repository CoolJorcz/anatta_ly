class AddLatLongToShares < ActiveRecord::Migration
  def change
    add_column :shares, :latitude,  :float
    add_column :shares, :longitude, :float
    add_column :shares, :gmaps, :boolean
  end
end
