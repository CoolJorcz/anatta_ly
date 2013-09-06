class Friend < ActiveRecord::Base
  belongs_to :requester, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates_presence_of :requester
  validates_presence_of :receiver
end
