class SearchController < ApplicationController
  def index
    @communities = Community.all.order(:prefecture_id)
  end
end
