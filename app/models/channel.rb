class Channel < ApplicationRecord
  has_many :channel_comments, dependent: :destroy
  belongs_to :group, required: true, foreign_key: 'group_id', class_name: "Group"
  belongs_to :user, required: true, foreign_key: 'user_id', class_name: "User"
  validates :group_id, presence: true
end
