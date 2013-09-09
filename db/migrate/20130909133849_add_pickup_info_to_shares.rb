class AddPickupInfoToShares < ActiveRecord::Migration
  def change
    add_column :shares, :pickup_location, :string
    add_column :shares, :pickup_time, :time
    add_column :shares, :return_location, :string
    add_column :shares, :return_time, :time
  end
end
