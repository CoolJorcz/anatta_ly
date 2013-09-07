class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    if (current_user == @user) || is_friend?(@user)
      @items = @user.items
    else
      redirect_to user_path(current_user)
    end
  end
end
