# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
require 'openuri'

def seed_category
  categories = ['Apparel', 'Sports & Outdoors', 'Children', 'Books, Movies & Music', 'Electronics', 'Miscellaneous']

  categories.each do |category|
  	Category.create(name: category)
  end
end


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
    if user.oauth_token != nil
      graph = Koala::Facebook::API.new(user.oauth_token)
       open(graph.get_picture(user.facebook_id))
      user.save!
    end
  end
end

set_facebook_photo
