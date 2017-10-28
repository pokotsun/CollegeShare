class ChannelsController < ApplicationController
  def index
    @group = Group.where(id: params[:id])
    @channel = Channel.new()
  end

  def show
  end
end
