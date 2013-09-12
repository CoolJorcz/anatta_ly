class AddNumReviewsToUser < ActiveRecord::Migration
  def change
    add_column :users, :num_reviews, :integer, default: 0
  end
end
