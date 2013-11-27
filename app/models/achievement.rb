require 'nokogiri'
class Achievement < ActiveRecord::Base
  has_attached_file :thumb, :styles => {:medium => "225x215>", :thumb => "48x48>" },
                    :url => "/ckeditor_assets/messages/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/messages/:id/:style_:basename.:extension"
                    
  default_scope {order("updated_at DESC")}
  scope :recent, -> { limit(5) }
  validates_presence_of :title, :content
  validates_attachment_size :thumb, :less_than => 10.megabytes
  belongs_to :page
  
  def plain_content
    Nokogiri::HTML(content).text[0..90]<<"......" if content.present?
  end
  
  def has_thumb?
    thumb.present?
  end
end
