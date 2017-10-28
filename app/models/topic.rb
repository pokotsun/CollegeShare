class Topic < ApplicationRecord
  has_many :topic_comments, dependent: :destroy
  belongs_to :community, required: true, foreign_key: 'community_id', class_name: "Community"
  belongs_to :user, required: true, foreign_key: 'user_id', class_name: "User"
  validates :community_id, presence: true


  def commenters
    commenters = []
    for comment in topic_comments
      user = comment.user
      if !commenters.include?(user)
        commenters.push(user)
      end
    end
    return commenters
  end

end
