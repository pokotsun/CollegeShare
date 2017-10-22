class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Devise: Where to redirect users once they have logged in
  protected
    def after_sign_in_path_for(resource)
      p "パス"
      # defaultではログイン後にsearchのshowに飛ばす
      search_path(resource.id)
    end
end
