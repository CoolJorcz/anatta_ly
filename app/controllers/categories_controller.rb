class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @friend_items = Friend.items_of_friends(current_user)
    @items = @category.items
  end
end
