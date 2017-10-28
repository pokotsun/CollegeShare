class TopicsController < ApplicationController
  before_action :set_current_community, only: [:show, :index, :create]
  def index
    @topics = Topic.where(community_id: params[:community_id]).page(params[:page]).per(10).order(:id)
    @topic = Topic.new()
  end

  def show
    @topic = Topic.find(params[:id])
    @comment = Comment.new()
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

  def create_comment
    @comment = Comment.new(create_comment_param)
    @topic = Topic.find(params[:id])
    @comment.save
  end

  private
    def create_topic_param
      params.require(:topic).permit(:title, :content).merge(good_num: 0, user_id: current_user.id, community_id: params[:community_id] )
    end

    def set_current_community
      @community = Community.find(params[:community_id])
    end

    def create_comment_param
      params.require(:comment).permit(:content).merge(good_num: 0, user_id: current_user.id, topic_id: params[:id])
    end
end
