class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :requester_id
      t.integer :receiver_id
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
