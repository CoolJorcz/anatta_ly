module UsersHelper

  def parse_facebook

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
end
