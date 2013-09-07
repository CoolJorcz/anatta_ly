class RequestsController < ApplicationController
  def index
    @user = User.find_by_id(current_user.id)
    @friend_requests = Friend.where(receiver_id: @user.id, approved: false)
  end
end
