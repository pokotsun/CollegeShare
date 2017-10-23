class Community < ApplicationRecord
  has_many :topics, dependent: :destroy
end
