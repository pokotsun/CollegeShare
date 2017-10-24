class Community < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :community_users
  has_many :users, through: :community_users

  def topic_fav_total
    num = 0
    topics.each do |topic|
      num += topic.good_num
    end
    return num
  end
end
