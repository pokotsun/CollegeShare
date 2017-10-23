class SearchController < ApplicationController
  def index
    p current_user.inspect
  end
end
