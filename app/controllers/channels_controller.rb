class ChannelsController < ApplicationController
  before_action :set_current_group, only: [:show, :index, :create]
  def index
    @channels = Group.find(params[:group_id]).channels.page(params[:page]).per(10).order(:id)
  end
  def show
  end

  private
    def create_topic_param
      params.require(:topic).permit(:title, :content).merge(good_num: 0, user_id: current_user.id, community_id: params[:community_id] )
    end

    def set_current_group
      @group = Group.find(params[:group_id])
    end
end
