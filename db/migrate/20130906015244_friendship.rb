class Friendship < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :requester_id
      t.integer :receiver_if
      t.boolean :approved

    end


  end
end
