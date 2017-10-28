class ChannelComment < ApplicationRecord
  belongs_to :channel, required:true
  belongs_to :user, required:true
end
