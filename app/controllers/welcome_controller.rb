class WelcomeController < ApplicationController
	def index
    if current_user
      @items = Friend.items_of_friends(current_user)
      @items.shuffle!
  	end
  end
end
