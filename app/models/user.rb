class User < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy
  # コミュニティとの関係 記述
  has_many :community_users
  has_many :communities, through: :community_users
  # グループとの関係 記述
  has_many :group_users
  has_many :groups, through: :group_users

  mount_uploader :profile_img, UserImage
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def user_image
    img = self.profile_img
    if File.exist?(Rails.root.to_s + "/public/user_images/#{img}")
      return "/user_images/#{img}"
    else
      return "user_img/#{img}"
    end
  end

end
