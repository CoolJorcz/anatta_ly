class Item < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :description, :user_id

end
