class TopicsController < ApplicationController
  def index
    @topics = Topic.all.page(params[:page]).per(10).order(:id)
    @topic = Topic.new
  end

  def show
  end

  def create
    @topic = Topic.new
  end

  private
    def topic_param
      params.require(:topic).permit(:title, :content, current_user,)
    end
end
