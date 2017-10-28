class TopicsController < ApplicationController
  before_action :set_current_community, only: [:show, :index, :create]
  def index
    @topics = Topic.where(community_id: params[:community_id]).page(params[:page]).per(10).order(:id)
  end

  def show
    @topic = Topic.first
  end

  def create
    @topic = Topic.new()
  end

  private
    def create_topic_param
      params.require(:topic).permit(:title, :content).merge(good_num: 0, user_id: current_user.id, community_id: null )
    end

    def set_current_community
      @community = Community.find(params[:community_id])
    end
end
