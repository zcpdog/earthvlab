module HomeHelper
  def show_links
    Link.all.map{|link|link_to(link.name,link.url,{:target=>"_blank",style: "color: #06c;"})}.join(" | ").html_safe
  end
  
  def display_image message
    image = "#{message.class.name.downcase}.png"
    if message.has_thumb?
      image = message.thumb.url(:thumb)
    end
    image_tag image, {class: :message_image}
  end
end
