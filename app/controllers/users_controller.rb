class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    graph = Koala::Facebook::API.new(@user.oauth_token)
    @profile_picture = graph.get_picture(@user.facebook_id)
    @items = @user.items.search(params[:search])
  end
end
