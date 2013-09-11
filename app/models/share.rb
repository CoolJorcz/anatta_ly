class Share < ActiveRecord::Base
  attr_accessible :item_id, :start_on, :end_on, :pickup_location, :pickup_time, :return_location, :return_time
  validates_presence_of :item_id, :borrower_id, :start_on, :end_on, :status

  belongs_to :item
  belongs_to :borrower, class_name: "User", foreign_key: "borrower_id"
  has_many :reviews

  def self.shares(current_user, status)
    items = current_user.items
    shares = []
    items.each do |item|
      shares << Share.where(item_id: item.id, status: status)
    end
    shares.flatten
  end

  def self.borrows(current_user, status)
    Share.where(borrower_id: current_user.id, status: status)
  end
end
