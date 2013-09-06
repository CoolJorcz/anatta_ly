class UsersController < ApplicationController
  def 

  def show
    # User's prof page. Should be the current_user
    @user = current_user.find_by_id(1)
    @item = Item.first
    @items = @user.items
  end
end
