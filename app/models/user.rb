class User < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :topic_comments, dependent: :destroy
  has_many :channel_comments, dependent: :destroy

  # コミュニティとの関係 記述
  has_many :community_users
  has_many :communities, through: :community_users
  # グループとの関係 記述
  has_many :group_users
  has_many :groups, through: :group_users

  # 画像アップローダーをマウント
  mount_uploader :profile_img, ProfileImgUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def user_image

    if !self.profile_img.nil? then
      img = self.profile_img
      if File.exist?(Rails.root.to_s + "/public/user_images/#{img}") then
        return "/user_images/#{img}"
      end
    else
      return "user_img/default.png"
    end
  end

end
