class TopicsController < ApplicationController
  before_action :set_current_community, only: [:show, :index, :create]
  before_action :set_current_topic, only: [:show, :create_comment, :update_good_num]

  def index
    @sort = params[:sort] || "0"
    @search_name = params[:search_name] || ""
    @topics = search_topics.page(params[:page]).per(10)
    @topic = Topic.new()
  end

  def show
    @topic = Topic.find(params[:id])
    @comment = TopicComment.new()
  end

  def update_good_num
    @topic.update(good_num: @topic.good_num + 1)
  end

  def update_good_num_topic
    @topic = Topic.find(params[:topic_id])
    @topic.update(good_num: @topic.good_num + 1)
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
    @comment = TopicComment.new(create_comment_param)
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

    # topic_commentのcontentにparamsをmergeで初期値追加
    def create_comment_param
      params.require(:topic_comment).permit(:content).merge(good_num: 0, user_id: current_user.id, topic_id: params[:id])
    end

    def search_topics
      topics = Topic.where(community_id: params[:community_id])
      topics = search_name(topics)
      topics = sort_topics(topics)
      topics
    end

    def sort_topics(topics)
      case params[:sort].to_i
      when 0 then # タイトル順
        topics.order(:id)
      when 1 then # ID順
        topics.order(:title)
      when 2 then # タイトル順
        topics.order(:good_num).reverse_order
      when 3 then # いいね数順
        topics.order(:created_at).reverse_order
      when 4 then # 作成時間順
        topics.order(:created_at)
      else # その他
        topics.order(:id)
      end
    end

    def search_name(topics)
      topics = params[:search_name].nil?? topics : topics.where("title like '%#{params[:search_name]}%'")
    end
end
