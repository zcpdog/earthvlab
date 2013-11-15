module HomeHelper
  def show_links
    Link.all.map{|link|link_to(link.name,link.url,{:target=>"_blank",style: "color: #06c;"})}.join(" | ").html_safe
  end
end
