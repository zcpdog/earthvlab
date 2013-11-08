class PagesController < ApplicationController
  before_filter :find_page, :only => [:show]
  
  def show
    if @page.root?
      add_breadcrumb @page.title
    else
      parents = Array.new
      the_page = @page
      while the_page.has_parent? do
        the_page = the_page.parent
        parents.push the_page
      end
      add_breadcrumb "首页", root_path
      parents.reverse_each {|page| add_breadcrumb page.title, page_path(page)}
      add_breadcrumb @page.title
    end
  end
  
  private
    def find_page
      @page = Page.find(params[:id])
    end
end
