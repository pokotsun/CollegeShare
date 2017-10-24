class Community < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :community_users
  has_many :users, through: :community_users
  
  def favo_user_num
    users.count
  end
end
