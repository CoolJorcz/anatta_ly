# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
require 'open-uri'

def seed_category
  categories = ['Apparel', 'Sports & Outdoors', 'Children', 'Books, Movies & Music', 'Electronics', 'Miscellaneous']

  categories.each do |category|
  	Category.create(name: category)
  end
end


<<<<<<< HEAD
categories.each do |category|
	Category.create(name: category)
end

@test_users = Koala::Facebook::TestUsers.new(:app_id => ENV['FB_APP_ID'], :secret => ENV['FB_APP_SECRET'])
installed_status = true
permissions = "user_photos, user_friends, user_location"
@test_users.create_network(10, installed_status, permissions)

=======
def new_item(user)
  Item.create!(name: Faker::Lorem.word,
           description: Faker::Lorem.sentence,
           size: ['Large', 'Medium', 'Small'].sample,
           color:['Red', 'Orange', "Yellow", "Blue"].sample,
           category: Category.all.sample,
           price: rand(1..100),
           user: user,
           image: File.new(Rails.root +
            'public/system/items/images/000/000/016/medium/bigpreview_Red_canoe.jpg'))
end

def seed_items

  10.times do
    User.all.each do |user|
      new_item(user)
    end
  end
end

def set_facebook_photo
  User.all.each do |user|
    if user.oauth_expires_at > Time.current
      user.avatar = open user.facebook_avatar_url
      user.save!
    end
  end
end

set_facebook_photo
>>>>>>> master
