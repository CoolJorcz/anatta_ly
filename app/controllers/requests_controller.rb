class RequestsController < ApplicationController
  def index
    # Show all friend requests and item requests for a particular user
    @user = User.find_by_id(current_user.id)
    @friend_requests = Friend.where(receiver_id: @user.id, approved: false)
  end

end
