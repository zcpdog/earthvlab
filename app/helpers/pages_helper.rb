module PagesHelper
  def active_link_to page, current_page
    if current_page.nil?
      link_to page.title, page_path(page)
    elsif page.id == current_page.id
      link_to page.title, page_path(page), {:class=>:active}
    elsif current_page.has_parent? and page.id == current_page.parent.id
      link_to page.title, page_path(page), {:class=>:active}
    else 
      link_to page.title, page_path(page)
    end
  end
  
  def root_link_to current_page
    if current_page.nil?
      link_to "首页", root_path, {class: "active"}
    else
      link_to "首页", root_path
    end
  end
end
