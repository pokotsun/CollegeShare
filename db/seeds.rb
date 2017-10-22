# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(:name => "こにしあつし",
  :account_id => "koniatsu",
  :profile_img => "sample_user_img4.jpg",
  :major => "理系",
  :email => 'a@b.com', :password => 'aaabbb')
user.save!
user = User.new(:name => "はやしみずき",
  :account_id => "meta713",
  :profile_img => "sample_user_img.jpg",
  :major => "理系",
  :email => 'c@d.com', :password => 'aaabbb')
user.save!

user = User.new(:name => "ぽこつん",
  :account_id => "pokotsun",
  :profile_img => "sample_user_img3.jpg",
  :major => "理系",
  :email => 'e@f.com', :password => 'aaabbb')
user.save!
