require 'nokogiri'
class HomeController < ApplicationController
  def index
  end
  
  def search
    @q = params[:search]
    @pages = Page.where("title LIKE ? OR content LIKE ?", "%#{@q}%", "%#{@q}%").page params[:page]
    add_breadcrumb "首页", "/"
    add_breadcrumb "搜索"
    add_breadcrumb params[:search]
  end
end
