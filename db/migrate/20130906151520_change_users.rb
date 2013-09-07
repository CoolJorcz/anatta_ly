class ChangeUsers < ActiveRecord::Migration
  def up
    add_column :users, :facebook_id, :integer, :limit => 8
  end
end
