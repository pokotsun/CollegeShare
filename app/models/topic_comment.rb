class TopicComment < ApplicationRecord
  belongs_to :topic, required:true
  belongs_to :user, required:true
end
