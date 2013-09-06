class UsersController < ApplicationController
  def show
    # User's prof page. Should be the current_user
    @user = User.find_by_id(1)
    @item = Item.first
    @items = @user.items
  end

  def index
    # Should only be user's possible friends
    @users = User.all
  end
end
