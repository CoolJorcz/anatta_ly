class Review < ActiveRecord::Base
  attr_accessible :comment

  validates_presence_of :share_id

  belongs_to :share
end
