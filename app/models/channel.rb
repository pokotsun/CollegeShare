class Channel < ApplicationRecord
  has_many :comments, dependent: :destroy, foreign_key: "topic_id"
  belongs_to :group, required: true, foreign_key: 'group_id', class_name: "Group"
  belongs_to :user, required: true, foreign_key: 'user_id', class_name: "User"
  validates :group_id, presence: true
end
