class SearchController < ApplicationController
  def index
    p current_user.inspect
    @communities = Community.all.order(:prefecture_id)
  end
end
