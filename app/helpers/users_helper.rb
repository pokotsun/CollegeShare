module UsersHelper
  def user_image_path(user)
    img = user.profile_img
    if File.exist?(Rails.root.to_s + "/public/user_images/#{img}")
      return "/user_images/#{img}"
    else
      return "user_img/#{img}"
    end
  end
end
