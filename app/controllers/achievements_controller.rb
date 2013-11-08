class AchievementsController < ApplicationController
  before_filter :find_model, :only => [:show]
  
  def index
    add_breadcrumb "首页", "/"
    add_breadcrumb "全部成果"
    @events = Achievement.all.page params[:page]
    render "commons/index"
  end
  
  def show 
    @event = @achievement
    add_breadcrumb "首页", "/"
    add_breadcrumb "成果展示", achievements_path
    add_breadcrumb @achievement.title
    render "commons/show"
  end
  
  private
    def find_model
      @achievement = Achievement.find(params[:id])
    end
end
