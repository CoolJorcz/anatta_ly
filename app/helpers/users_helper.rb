module UsersHelper

  def parse_facebook
    facebook_ids = User.all.map {|user| user.facebook_id.to_s }
    matches = []

    facebook_ids.each do |id|
      matches << @friends.select{|friend| friend['id'] == id}
    end
    matches.select{|item| item.any?}
  end
end
