class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
<<<<<<< HEAD
    @profile_picture = @user.avatar.url
=======

    graph = Koala::Facebook::API.new(@user.oauth_token)
    @profile_picture = graph.get_picture(@user.facebook_id)
    
>>>>>>> Made changes per Abi's code review
    @items = @user.items
  end
end
