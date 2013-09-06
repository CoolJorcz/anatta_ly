class RequestsController < ApplicationController
  def index
    # Show all friend requests and item requests for a particular user
    @user = User.find_by_id(4) # change to current_user
    @friend_requests = Friend.where(receiver_id: @user.id, approved: false)
  end

end
