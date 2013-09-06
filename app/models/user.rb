class User < ActiveRecord::Base
  has_many :items
  has_many :friends

  def self.from_omniauth(auth)
  	where(auth.slice(:provider,:uid)).first_or_initialize.tap do |user|
  		user.provider = auth.provider
  		user.facebook_id = auth.uid
  		user.name = auth.info.name
  		user.oauth_token = auth.credentials.token
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  		user.save!
  	end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.ingo e.to_s
    nil # or consider a custom null object
  end

  def friends_count
    facebook { |fb| fb.get_connection("me", "friends").size }
  end
end
