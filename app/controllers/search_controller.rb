class SearchController < ApplicationController
  def index
    @communities = Community.all.page(params[:page]).per(10).order(:prefecture_id)
  end
end
