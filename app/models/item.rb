class Item < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :description, :user_id
  attr_accessible :name, :description, :size, :color
end
