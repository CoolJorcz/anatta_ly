class ItemsController < ApplicationController
  def index
    # This should be all items of FRIENDS
    @items = Item.all
  end

  def new
    # Make sure to add some logic to ensure a user is signed in
    @item = Item.new
  end

  def create
    # User should be @user after oauth stuff is all setup (@user = current_user)
    @user = User.find_by_id(1)
    @item = Item.new(params[:item])
    @item.user_id = @user.id
    @item.save

    redirect_to item_url(@item)
  end

  def show
    @item = Item.find_by_id(params[:id])
  end
end
