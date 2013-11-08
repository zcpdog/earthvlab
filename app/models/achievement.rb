require 'nokogiri'
class Achievement < ActiveRecord::Base
  default_scope {order("updated_at DESC")}
  validates_presence_of :title, :content
  def plain_content
    Nokogiri::HTML(content).text[0..60]<<"..." if content.present?
  end
end
