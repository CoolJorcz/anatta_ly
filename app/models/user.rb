class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  has_many :borrows
  has_many :shares, through: :items
  has_many :friends, foreign_key: :requestor_id, foreign_key: :receiver_id

  attr_accessible :avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  def gmaps4rails_address
      #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.country}"
  end

  def self.from_omniauth(auth)

    # immediately get 60 day auth token
    oauth = Koala::Facebook::OAuth.new(ENV['FB_APP_ID'], ENV['FB_APP_SECRET'])
    new_access_info = oauth.exchange_access_token_info auth.credentials.token

    new_access_token = new_access_info["access_token"]
    new_access_expires_at = DateTime.now + new_access_info["expires"].to_i.seconds

    where(auth.slice(:provider,:uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.facebook_id = auth.uid
      user.name = auth.info.name
      user.oauth_token = new_access_token
      user.oauth_expires_at = new_access_expires_at
      user.avatar = open user.facebook_avatar_url
      user.save!
    end
  end

  def facebook_avatar_url
    graph = Koala::Facebook::API.new(self.oauth_token)
    graph.get_picture(uid)
  end

  def facebook
    begin
      @facebook ||= Koala::Facebook::API.new(oauth_token)
      block_given? ? yield(@facebook) : @facebook
    rescue Koala::Facebook::APIError => e
      logger.ingo e.to_s
      nil # or consider a custom null object
    end
  end

  def friends_count
    facebook { |fb| fb.get_connection("me", "friends").size }
  end

  def update_feedback_reviews
    borrows = Share.where(borrower_id: self.id)
    reviews = []
    borrows.each do |share|
      Review.all.each do |review|
        reviews << review if share.id == review.share_id
      end
    end

    total_stars = 0
    total_condition = 0
    total_lend_agains = 0
    total_returned_on_time = 0

    reviews.each do |review|
      total_stars += review.stars
      total_condition += review.condition
      total_lend_agains +=1 if review.lend_again == true
      total_returned_on_time += 1 if review.returned_on_time == true
    end

    if reviews.length > 0
      self.avg_stars = (total_stars.to_f / reviews.length).ceil
      self.avg_condition = total_stars.to_f / reviews.length
      self.percent_lend_again = (100 * total_lend_agains.to_f / reviews.length).to_i
      self.percent_returned_on_time = (100 * total_returned_on_time.to_f / reviews.length).to_i
      self.save
    end

  end
end
