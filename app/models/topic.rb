class Topic < ApplicationRecord
  belongs_to :community, required: true, foreign_key: 'community_id', class_name: "Community"
  belongs_to :user, required: true, foreign_key: 'user_id', class_name: "User"
  validates :community_id, presence: true
end
