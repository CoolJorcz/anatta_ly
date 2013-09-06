class ItemsController < ApplicationController
  def index
    # This should be all items of FRIENDS
    @items = Item.all
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
      flash[:notice] = "Successful Create"
      @item.save
      redirect_to item_url(@item)
    else
      flash[:notice] = "Failed validation"
      render :new
    end
  end

  def show
    @item = Item.find_by_id(params[:id])
  end

  def edit
    @item = Item.find_by_id(params[:id])
  end

  def update
    @item = Item.find_by_id(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to item_url(@item)
    else
      flash[:notice] = "Failed validation"
      render :edit
    end
  end

  def destroy
    # Make sure redirects to correct user
    @item = Item.find_by_id(params[:id])
    @item.destroy
    redirect_to user_path(current_user.id)
  end
end
