class Item < ActiveRecord::Base
  attr_accessible :name, :description, :size, :color, :image, :category_id

  validates_presence_of :name, :description, :user_id, :image_file_name, :category_id
  #validates_attachment_presence :image

  belongs_to :user
<<<<<<< HEAD
  belongs_to :category
  has_many :shares, dependent: :destroy
  has_many :borrowers, class_name: "User"

  has_attached_file :image, styles: { medium: "300x300>", small:"200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
=======
  has_many :shares, dependent: :destroy
  has_many :borrowers, class_name: "User"
  has_attached_file :image, styles: { medium: "300x300>", small_sq: "200x200", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
>>>>>>> 2e231b19b2e744cd56d381924f17a4bc375ceb3c

  def self.items_of_friends(current_user)
    friends = Friend.get_friends(current_user)
    items = []
    friends.each do |friend|
      items << friend.items
    end
    items.flatten
  end
end
