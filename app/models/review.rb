class Review < ActiveRecord::Base
  attr_accessible :share_id, :stars, :condition, :lend_again, :returned_on_time, :comment

  validates_presence_of :share_id, :stars, :condition, :lend_again, :returned_on_time

  belongs_to :share
end

