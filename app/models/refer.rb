require 'nokogiri'
class Refer < ActiveRecord::Base
  default_scope {order("updated_at DESC")}
  validates_presence_of :title, :content

  def plain_content
    Nokogiri::HTML(content).text[0..50] if content.present?
  end
end
