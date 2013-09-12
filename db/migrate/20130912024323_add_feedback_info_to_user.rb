class AddFeedbackInfoToUser < ActiveRecord::Migration
  def change
  	add_column :users, :avg_stars, :integer, default: 0
  	add_column :users, :avg_condition, :integer, default: 0
  	add_column :users, :percent_lend_again, :integer, default: 0
  	add_column :users, :percent_returned_on_time, :integer, default: 0
  end
end