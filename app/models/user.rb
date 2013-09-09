class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  has_many :borrows
  has_many :shares, through: :items
  has_many :friends, foreign_key: :requestor_id, foreign_key: :receiver_id

  attr_accessible :avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

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
  		user.save!
  	end
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
end
