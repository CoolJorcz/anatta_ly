class RemoveBoolsReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :lend_again
    remove_column :reviews, :returned_on_time
  end
end
