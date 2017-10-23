# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.new(:name => "こにしあつし",
  :account_id => "koniatsu",
  :profile_img => "sample_user_img4.jpg",
  :major => "理系",
  :email => 'a@b.com', :password => 'aaabbb')
user1.save!

user2 = User.new(:name => "はやしみずき",
  :account_id => "meta713",
  :profile_img => "sample_user_img.jpg",
  :major => "理系",
  :email => 'c@d.com', :password => 'aaabbb')
user2.save!

user3 = User.new(:name => "ぽこつん",
  :account_id => "pokotsun",
  :profile_img => "sample_user_img3.jpg",
  :major => "理系",
  :email => 'e@f.com', :password => 'aaabbb')
user3.save!

(1..15).each do |i|
  community = Community.create(
    :college_name => "学校その#{i}",
    :campus_name => "第#{i}キャンパス",
    :prefecture_id => "#{i}",
    :major => "#{i%3}",
  )
  (1..5).each do |j|
    Topic.create(
      :title => "タイトルその#{j}",
      :content => "内容その#{j}",
      :good_num => i + j,
      :user_id => user1.id,
      :community_id => community.id,
    )
  end
end

(1..15).each do |i|
  community = Community.create(
    :college_name => "学校その#{i}",
    :campus_name => "第#{i}キャンパス",
    :prefecture_id => "#{i}",
    :major => "#{i%3}",
  )
  (5..10).each do |j|
    Topic.create(
      :title => "タイトルその#{j}",
      :content => "内容その#{j}",
      :good_num => i + j,
      :user_id => user2.id,
      :community_id => community.id,
    )
  end
end
