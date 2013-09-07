class Item < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :description, :user_id
  attr_accessible :name, :description, :size, :color

  def self.items_of_friends(current_user)
    friends = Friend.get_friends(current_user)
    items = []
    friends.each do |friend|
      items << friend.items
    end
    items.flatten
  end
end
