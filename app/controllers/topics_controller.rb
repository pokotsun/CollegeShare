class TopicsController < ApplicationController
  before_action :set_current_community, only: [:show, :index, :create]
  def index
    @topics = Topic.where(community_id: params[:community_id]).page(params[:page]).per(10).order(:id)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(create_topic_param)
    respond_to do |format|
      if @topic.save
        format.html { redirect_to "/communities/#{@community.id}/topics/#{@topic.id}" }
      else
        format.html { render action: 'index' }
      end
    end
  end

  private
    def create_topic_param
      params.require(:topic).permit(:title, :content).merge(good_num: 0, user_id: current_user.id, community_id: params[:community_id] )
    end

    def set_current_community
      @community = Community.find(params[:community_id])
    end
end
