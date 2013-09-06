class FriendsController < ApplicationController
  def index
    # Should only be user's possible friends
    @users = User.all
  end
end
