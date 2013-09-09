class WelcomeController < ApplicationController
	def index
    @friends = Friend.get_friends(current_user)
    @items = []
    @friends.each do |friend|
      friend.items.each do |item|
        @items << item
      end
    end
	end
end
