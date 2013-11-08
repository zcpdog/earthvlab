class RefersController < ApplicationController
  before_filter :find_model, :only => [:show]
  
  def index
    add_breadcrumb "首页", "/"
    add_breadcrumb "全部咨询"
    @events = Refer.all.page params[:page]
    render "commons/index"
  end
  
  def show 
    @event = @refer
    add_breadcrumb "首页", "/"
    add_breadcrumb "通知", refers_path
    add_breadcrumb @refer.title
    render "commons/show"
  end
  
  private
    def find_model
      @refer = Refer.find(params[:id])
    end
end
