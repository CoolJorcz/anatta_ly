class WelcomeController < ApplicationController
	def index
    if current_user
      @friends = Friend.get_friends(current_user)
      @items = []
      @friends.each do |friend|
        friend.items.each do |item|
          @items << item
        end
      end
      @items.shuffle!
  	end
  end
end
