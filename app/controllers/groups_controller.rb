class GroupsController < ApplicationController
  def index
  end

  def show
    @group = Group.where(id: params[:id]).first
  end
end
