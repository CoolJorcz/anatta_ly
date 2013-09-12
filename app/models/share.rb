class Share < ActiveRecord::Base
  attr_accessible :item_id, :start_on, :end_on, :pickup_location, :pickup_time, :return_location, :return_time, :borrower_id
  validates_presence_of :item_id, :borrower_id, :start_on, :end_on, :status

  belongs_to :item
  belongs_to :borrower, class_name: "User"

  def self.shares(current_user, status = nil)
    items = current_user.items
    shares = []
    items.each do |item|
      if status.nil?
        shares << Share.where(item_id: item.id)
      else
        shares << Share.where(item_id: item.id, status: status)
      end
    end
    shares.flatten
  end

  def self.borrows(current_user)
    Share.where(borrower_id: current_user.id)
  end
end
