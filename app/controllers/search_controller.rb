class SearchController < ApplicationController
  def index
    p current_user.inspect
    @communities = Community.all.page(params[:page]).per(10).order(:prefecture_id)
  end
end
