class StaticPagesController < ApplicationController
  before_action :authenticate_user!, :except=>[:home,:start]
  def home
  end
  def start
  end
end
