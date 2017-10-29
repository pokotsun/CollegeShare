class CommunitiesController < ApplicationController
  def index
    @sort = params[:sort] || "0"
    @search_name = params[:search_name] || ""
    @communities = search_communities.page(params[:page]).per(10)
  end

  def show
  end

  private
    def search_communities
      communities = Community.all
      communities = search_name(communities)
      communities = sort_communities(communities)
      communities
    end

    def search_name(communities)
      communities = params[:search_name].nil?? communities : communities.where("college_name like '%#{params[:search_name]}%'")
    end

    def sort_communities(communities)
      case params[:sort].to_i
      when 0 then
        communities.order(:prefecture_id)
      when 1 then
        communities.order(:college_name)
      when 2 then
        communities.order(:prefecture_id)
        #communities.order(:favo_user_num).reverse_order  まだ
      when 3 then
        communities.joins(:prefecture).order("prefectures.name") #おそらくまだ
      when 4 then
        communities.order(:prefecture_id)
      else
        communities.order(:prefecture_id)
      end
    end
end
