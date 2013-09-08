class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    if (current_user == @user) || is_friend?(@user)
      @items = @user.items
      graph = Koala::Facebook::API.new(@user.oauth_token)
      @profile_picture = graph.get_picture(@user.facebook_id)
    else
      redirect_to user_path(current_user)
    end
  end
end
