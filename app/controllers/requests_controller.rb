class RequestsController < ApplicationController
  def index
    @user = current_user
    @friend_requests = Friend.where(receiver_id: @user.id, approved: false)
  end
end
