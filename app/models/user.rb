class User < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :community_users
  has_many :communities, through: :community_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
