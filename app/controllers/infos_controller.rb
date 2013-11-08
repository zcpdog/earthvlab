class InfosController < ApplicationController
  before_filter :find_model, :only => [:show]
  
  def index
    add_breadcrumb "首页", "/"
    add_breadcrumb "全部通知"
    @events = Info.all.page params[:page]
    render "commons/index"
  end
  
  def show 
    @event = @info
    add_breadcrumb "首页", "/"
    add_breadcrumb "通知", infos_path
    add_breadcrumb @info.title
    render "commons/show"
  end
  
  private
    def find_model
      @info = Info.find(params[:id])
    end
end
