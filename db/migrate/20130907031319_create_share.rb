class CreateShare < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :item_id
      t.integer :borrower_id
      t.datetime :start_on
      t.datetime :end_on
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
