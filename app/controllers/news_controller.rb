class NewsController < ApplicationController
  before_filter :find_model, :only => [:show]
  
  def index
    add_breadcrumb "首页", "/"
    add_breadcrumb "全部新闻"
    @events = News.all.page params[:page]
    render "commons/index"
  end
  
  def show 
    @event = @news
    add_breadcrumb "首页", "/"
    add_breadcrumb "新闻", news_index_path
    add_breadcrumb @news.title
    render "commons/show"
  end
  
  private
    def find_model
      @news = News.find(params[:id])
    end
end
