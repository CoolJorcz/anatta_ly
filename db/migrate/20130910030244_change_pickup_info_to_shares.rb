class ChangePickupInfoToShares < ActiveRecord::Migration
  def change
    change_column :shares, :pickup_time, :string
    change_column :shares, :return_time, :string
  end
end
