class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  # Devise: Where to redirect users once they have logged in
  include UsersHelper

  protected
  def after_sign_up_path_for(resource)
    #Or :prefix_to_your_route
  end

  def after_sign_in_path_for(resource)
    # defaultではログイン後にcommunitiesのshowに飛ばす
    communities_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :major, :profile_img, :account_id])
  end

end
