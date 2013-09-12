class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :share_id
      t.integer :stars
      t.text :comment
      t.integer :condition
      t.boolean :lend_again
      t.boolean :returned_on_time

      t.timestamps
    end
  end
end
