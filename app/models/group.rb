class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :channels, dependent: :destroy
end
