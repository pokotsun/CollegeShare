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
  :profile_img => "default",
  :major => "理系",
  :email => 'a@b.com',
  :password => 'aaabbb')
  user1.save!

  user2 = User.new(:name => "はやしみずき",
  :account_id => "meta713",
  :profile_img => "sample_user_img1.jpg",
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


  community = Community.create!(
  :college_name => "九州工業大学",
  :campus_name => "飯塚キャンパス",
  :prefecture_id => "40",
  :major => "1",)

  group = Group.create!(
  :name => "ポコメタ淳",)

  users.each do |user|
    community_user = CommunityUser.create!(
    :user_id => user.id,
    :community_id => community.id,)

    group_user = GroupUser.create!(
    :user_id => user.id,
    :group_id => group.id,)
  end

  topic = Topic.create!(
  :title => "九州工業大学の飯塚キャンパスに行ってきました!!",
  :content => "オープンキャンパスとは、学校法人がその学校へ入学を希望・考慮している者に対して、施設内を公開し、学校への関心を深めて貰おうとする、入学促進イベントの一種。
日本では、主に大学、専門学校、高等学校などが開催しているが、大学以外では「体験入学」や「オープンスクール」と称することも多い。
似た制度でオープンカレッジがあるが、こちらは一般の人の生涯学習を目的にして大学が行う専門の講座のことである。
1990年代以前は、高校生やその父兄を対象とした大学構内の積極的な公開は行われていなかったが、いわゆる少子化を背景に、受験生の確保を目的に1990年代後半頃から一部の大学で行われるようになった。その後2000年代になると偏差値が高いとされる、いわゆる難関校と呼ばれる大学でも開催されるようになったが、これは少子化を背景としたものではなく、よりミスマッチの少ない学生を入学させたいという意図から行われている。
なお、オープンキャンパスと銘打っていなくても、施設の見学や相談などを随時受け付けている場合も多く、普段の大学の様子を学内に入って自由に見学することを認めている大学も多い。",
  :good_num =>  6,
  :user_id => users[2].id,
  :community_id => community.id,)

  topic = Topic.create!(
  :title => "九工大って何してるのか見に行った!!",
  :content => "銘打っていなくても、施設の見学や相談などを随時受け付けている場合も多く、普段の大学の様子を学内に入って自由に見学することを認めている大学も多い。",
  :good_num =>  6,
  :user_id => users[2].id,
  :community_id => community.id,)topic = Topic.create!(
  :title => "九工大の情報工学部のある飯塚って手榴弾落ちてるって本当か検証しにいった",
  :content => "キャンパスと銘打っていなくても、施設の見学や相談などを随時受け付けている場合も多く、普段の大学の様子を学内に入って自由に見学することを認めている大学も多い。",
  :good_num =>  6,
  :user_id => users[2].id,
  :community_id => community.id,)

  channel = Channel.create!(
  :title => "九工大の飯塚キャンパスが気になる件",
  :user_id => users[2].id,
  :group_id => group.id,)
  channel = Channel.create!(
  :title => "九工大って何してるのか見に行った",
  :user_id => users[2].id,
  :group_id => group.id,)
  channel = Channel.create!(
  :title => "九工大の情報工学部のある飯塚って手榴弾落ちてるって本当か検証しにいった",
  :user_id => users[2].id,
  :group_id => group.id,)

  topic_comment = TopicComment.create!(
  :content => "キャンパスは綺麗だった？？",
  :good_num => 1 ,
  :user_id => users[1].id,
  :topic_id => topic.id,)

  channel_comment = ChannelComment.create!(
  :content => "みんな、どこにいきたい？？！",
  :user_id => users[1].id,
  :channel_id => channel.id,)


  # データ作っていく
  (1..10).each do |i|
    # communityの生成
    community = Community.create!(
    :college_name => "学校その#{i}",
    :campus_name => "第#{i}キャンパス",
    :prefecture_id => "#{i}",
    :major => "#{i%3}",)

    # groupの生成
    group = Group.create!(
    :name => "グループ#{i}",)

    # ユーザーごとにコミュニティとグループのm対nの関係を作る
    users.each do |user|
      community_user = CommunityUser.create!(
      :user_id => user.id,
      :community_id => community.id,)

      group_user = GroupUser.create!(
      :user_id => user.id,
      :group_id => group.id,)
    end

    (1..5).each do |j|
      # トピックの生成
      topic = Topic.create!(
      :title => "タイトルその#{i + j}",
      :content => "内容その#{i + j}",
      :good_num => i + j + 10,
      :user_id => users[i%3].id,
      :community_id => community.id,)

      # チャンネルの作成
      channel = Channel.create!(
      :title => "タイトルその#{i + j}",
      :user_id => users[j%3].id,
      :group_id => group.id,)

      # 各コメントの作成
      (1..5).each do |k|
        # トピックコメントの作成
        topic_comment = TopicComment.create!(
        :content => "オープンキャンパスとは、学校法人がその学校へ入学を希望・考慮している者に対して、施設内を公開し、学校への関心を深めて貰おうとする、入学促進イベントの一種。
    日本では、主に大学、専門学校、高等学校などが開催しているが、大学以外では「体験入学」や「オープンスクール」と称することも多い。
    似た制度でオープンカレッジがあるが、こちらは一般の人の生涯学習を目的にして大学が行う専門の講座のことである。
    1990年代以前は、高校生やその父兄を対象とした大学構内の積極的な公開は行われていなかったが、いわゆる少子化を背景に、受験生の確保を目的に1990年代後半頃から一部の大学で行われるようになった。その後2000年代になると偏差値が高いとされる、いわゆる難関校と呼ばれる大学でも開催されるようになったが、これは少子化を背景としたものではなく、よりミスマッチの少ない学生を入学させたいという意図から行われている。
    なお、オープンキャンパスと銘打っていなくても、施設の見学や相談などを随時受け付けている場合も多く、普段の大学の様子を学内に入って自由に見学することを認めている大学も多い。",
        :good_num => 1 + j + k,
        :user_id => users[(i+j+k) % 3].id,
        :topic_id => topic.id,)

        # チャンネルコメントを生成
        channel_comment = ChannelComment.create!(
        :content => "チャンネルの話の内容#{i + j + k}" * 3,
        :user_id => users[k % 3].id,
        :channel_id => channel.id,)
      end
    end
  end
