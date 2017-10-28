class TopicsController < ApplicationController
  before_action :set_current_community, only: [:show, :index, :create]
  before_action :set_current_topic, only: [:show, :create_comment, :update_good_num]

  def index
    @topics = Topic.where(community_id: params[:community_id]).page(params[:page]).per(10).order(:id)
    @topic = Topic.new()
  end

  def show
    @comment = Comment.new()
  end

  def update_good_num
    @topic.update(good_num: 0)
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
    @comment.save
  end

  private
    def create_topic_param
      params.require(:topic).permit(:title, :content).merge(good_num: 0, user_id: current_user.id, community_id: params[:community_id] )
    end

    def set_current_community
      @community = Community.find(params[:community_id])
    end

    def set_current_topic
      @topic = Topic.find(params[:id])
    end

    def create_comment_param
      params.require(:comment).permit(:content).merge(good_num: 0, user_id: current_user.id, topic_id: params[:id])
    end
end
