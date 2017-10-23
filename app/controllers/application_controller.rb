class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Devise: Where to redirect users once they have logged in
  protected
    def after_sign_in_path_for(resource)
      # defaultではログイン後にsearchのshowに飛ばす
      search_index_path
    end

    def after_sign_out_path_for(resource)
      new_user_session_path
    end
end
