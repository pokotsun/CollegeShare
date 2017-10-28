class TopicsController < ApplicationController
  def index
    @topics = Topic.all.page(params[:page]).per(10).order(:id)
  end

  def show
    @topic = Topic.first
  end

  def create
  end
end
