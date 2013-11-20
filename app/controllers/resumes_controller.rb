class ResumesController < ApplicationController
  def show
    add_breadcrumb "首页", root_path
    add_breadcrumb "教师简历", page_path(Setting.find_by(name: :resume).page)
    @resume = Resume.find(params[:id])
    add_breadcrumb @resume.user.name 
  end
end
