class SearchController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
