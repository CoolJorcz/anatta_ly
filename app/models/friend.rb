class Friend < ActiveRecord::Base
  attr_accessible :requester_id, :receiver_id
  belongs_to :requester, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates_presence_of :requester
  validates_presence_of :receiver


  def self.facebook_friends(current_user)
    graph = Koala::Facebook::API.new(current_user.oauth_token)
    friends = graph.get_connections("me", "friends")

    # Find all the FB id's from anattaly Users
    facebook_ids = User.all.map { |user| user.facebook_id.to_s }

    # Select the matches between my FB friends and anattaly Users
    matches = []
    facebook_ids.each do |id|
      matches << friends.select{ |friend| friend['id'] == id }
    end

    # Remove empty arrays and make hash easier to use
    user_matches = matches.select{ |item| item.any? }.map{ |match| match.pop }

    # Return the anattaly User object for those members that match
    anattaly_user_matches = []
    user_matches.each{ |user| anattaly_user_matches << User.find_by_facebook_id(user["id"].to_i) }
    anattaly_user_matches
  end

  def self.facebook_friends_to_add(current_user)
    # facebookfriends that I'm not friends with on anattaly yet
    friends_to_add = self.facebook_friends(current_user).select do |friend|
       Friend.find_by_receiver_id(friend.id) == nil && Friend.find_by_requester_id(friend.id) == nil
    end
  end

  def self.get_friends(current_user)
    # Find all approved friend objects where user is a requester or reciever
    friend_objects = Friend.where(requester_id: current_user.id, approved: true) + Friend.where(receiver_id: current_user.id, approved: true)

    # Save a user object for each friend
    friends_as_users = []
    friend_objects.each do |friend|
      if friend.requester_id == current_user.id
        friends_as_users << User.find_by_id(friend.receiver_id)
      elsif friend.receiver_id == current_user.id
        friends_as_users << User.find_by_id(friend.requester_id)
      end
    end
    friends_as_users
  end
end
