class ItemsController < ApplicationController
  def index
    if current_user
      @items = Item.items_of_friends(current_user)
    else
      redirect_to root_path
    end
  end

  def new
    if current_user
      @item = Item.new
    else
      redirect_to :root
    end
  end

  def create
    @user = current_user
    @item = Item.new(params[:item])
    @item.user_id = @user.id

    if @item.valid?
      @item.save
      redirect_to item_url(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to item_url(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(current_user.id)
  end
end
