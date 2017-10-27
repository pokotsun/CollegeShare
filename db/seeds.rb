# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 県名生成
prefectures = Prefecture.create!(
[
  {name: "北海道"}, {name: "青森県"}, {name: "岩手県"},
  {name: "宮城県"}, {name: "秋田県"}, {name: "山形県"},
  {name: "福島県"}, {name: "茨城県"}, {name: "栃木県"},
  {name: "群馬県"}, {name: "埼玉県"}, {name: "千葉県"},
  {name: "東京都"}, {name: "神奈川県"}, {name: "新潟県"},
  {name: "富山県"}, {name: "石川県"}, {name: "福井県"},
  {name: "山梨県"}, {name: "長野県"}, {name: "岐阜県"},
  {name: "静岡県"}, {name: "愛知県"}, {name: "三重県"},
  {name: "滋賀県"}, {name: "京都府"}, {name: "大阪府"},
  {name: "兵庫県"}, {name: "奈良県"}, {name: "和歌山県"},
  {name: "鳥取県"}, {name: "島根県"}, {name: "岡山県"},
  {name: "広島県"}, {name: "山口県"}, {name: "徳島県"},
  {name: "香川県"}, {name: "愛媛県"}, {name: "高知県"},
  {name: "福岡県"}, {name: "佐賀県"}, {name: "長崎県"},
  {name: "熊本県"}, {name: "大分県"}, {name: "宮崎県"},
  {name: "鹿児島県"}, {name: "沖縄県"},])

user1 = User.new(:name => "こにしあつし",
:account_id => "koniatsu",
:profile_img => "sample_user_img4.jpg",
:major => "理系",
:email => 'a@b.com',
:password => 'aaabbb')
user1.save!

user2 = User.new(:name => "はやしみずき",
:account_id => "meta713",
:profile_img => "sample_user_img.jpg",
:major => "理系",
:email => 'c@d.com',
:password => 'aaabbb')
user2.save!

user3 = User.new(:name => "ぽこつん",
:account_id => "pokotsun",
:profile_img => "sample_user_img3.jpg",
:major => "理系",
:email => 'e@f.com',
:password => 'aaabbb')
user3.save!

users = [user1, user2, user3]

(1..15).each do |i|
  community = Community.create!(
  :college_name => "学校その#{i}",
  :campus_name => "第#{i}キャンパス",
  :prefecture_id => "#{i}",
  :major => "#{i%3}",)
  (1..5).each do |j|
    topic = Topic.create!(
    :title => "タイトルその#{i + j}",
    :content => "内容その#{i + j}",
    :good_num => i + j + 10,
    :user_id => users[i%3].id,
    :community_id => community.id,)
    (1..5).each do |k|
      comment = Comment.create!(
      :content => "話の内容#{i + j + k}" * 3,
      :good_num => 1 + j + k,
      :user_id => users[(i+j+k) % 3].id,
      :topic_id => topic.id,)
    end
  end
  users.each do |user|
    community_user = CommunityUser.create!(
      :user_id => user.id,
      :community_id => community.id,)
  end
end
