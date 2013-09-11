class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @profile_picture = @user.avatar.url
    @items = @user.items

    # Refactor below code out of controller
    borrows = Share.where(borrower_id: @user.id)
		@reviews = []
		borrows.each do |share|
		  Review.all.each do |review|
		    @reviews << review if share.id == review.share_id
		  end
		end

		total_stars = 0
		total_condition = 0
		total_lend_agains = 0
		total_returned_on_time = 0

		@reviews.each do |review|
		  total_stars += review.stars
		  total_condition += review.condition
		  total_lend_agains +=1 if review.lend_again == true
		  total_returned_on_time += 1 if review.returned_on_time == true
		end

		if @reviews.length > 0
			@avg_stars = (total_stars / @reviews.length).ceiling
			@avg_condition = total_stars / @reviews.length
			@percentage_lend_again = total_lend_agains / @reviews.length
			@percentage_returned_on_time = total_returned_on_time / @reviews.length
		end
  end
end
