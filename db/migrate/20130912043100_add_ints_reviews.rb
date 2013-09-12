class AddIntsReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :lend_again, :integer, default: 1
    add_column :reviews, :returned_on_time, :integer, default: 1
  end
end
