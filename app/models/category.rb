class Category < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name

  has_many :items

  # scope :find_category, where(category_id: item.category)
end
