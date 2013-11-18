require 'nokogiri'
class Achievement < ActiveRecord::Base
  has_attached_file :thumb, :styles => { :thumb => "48x48>" },
                    :url => "/ckeditor_assets/messages/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/messages/:id/:style_:basename.:extension"
                    
  default_scope {order("updated_at DESC")}
  validates_presence_of :title, :content
  
  def plain_content
    Nokogiri::HTML(content).text[0..100]<<"......" if content.present?
  end
  
  def has_thumb?
    thumb.present?
  end
  
  def url
    url(:thumb)
  end
end
