class Share < ActiveRecord::Base
  attr_accessible :item_id, :start_on, :end_on
  validates_presence_of :item_id, :borrower_id, :start_on, :end_on, :status

  belongs_to :item
  belongs_to :borrower, class_name: "User", foreign_key: "borrower_id"

  def self.share_requests(current_user)
    items = current_user.items
    shares = []
    items.each do |item|
      shares << Share.where(item_id: item.id, status: "pending")
    end
    shares.flatten
  end

  def self.borrow_requests(current_user)
    Share.where(borrower_id: current_user.id, status: "pending")
  end
end
