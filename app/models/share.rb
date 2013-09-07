class Share < ActiveRecord::Base
  validates_presence_of :item_id, :borrower_id, :start_on, :end_on, :status

  belongs_to :item
  belongs_to :borrower, class_name: "User", foreign_key: "borrower_id"

  def self.borrow_requests(current_user)
    shares = Share.where(borrower_id: current_user.id, status: "pending")
    requests = []
    shares.each do |share|
      requests << Item.find(share.item_id)
    end
    requests
  end
end
