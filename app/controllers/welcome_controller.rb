class WelcomeController < ApplicationController
	def index
    if current_user
    	unless params[:search]
      	@items = Friend.items_of_friends(current_user)
      	@items.shuffle!
      else
      	friend_items = Item.items_of_friends(current_user)
      	@items = friend_items.search(params[:search])
      end
      @categories = Category.all
      @friends = Friend.get_friends(current_user)
      @all_borrows = Share.borrows(current_user)
      @all_shares = current_user.shares
  	end
  end

  def about
  end

  def images 
    images = Item.item_images
    render json: {images: images}
  end
end
