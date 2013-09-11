class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @profile_picture = @user.avatar.url
    @items = @user.items
  end
end
