class GroupsController < ApplicationController
  def index
  end

  def create
    # エラー処理
    created_group = Group.create(post_params)
    members = params[:members]
    group_id = created_group.id
    members.each do |user_id|
      GroupUser.create(group_id: group_id,user_id: user_id)
    end

    redirect_to controller: :channels, action: :index, group_id: group_id
  end

  def show
  end

  private
  def post_params
    # submitしたデータのうち、Model作成に必要なものを
    # permitの引数に指定する
    params.require(:group).permit(
    :name)
  end
end
