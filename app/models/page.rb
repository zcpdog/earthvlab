class Page < ActiveRecord::Base
  belongs_to  :parent, foreign_key: :parent_id , class_name: :Page
  has_many    :children, foreign_key: :parent_id , class_name: :Page , dependent: :destroy
  has_many    :resumes
  scope :root, -> { where parent_id: nil }
  #scope :resume_pages, -> { where title.include? "简历"}
  
  
  def has_parent?
    parent.present?
  end
  
  def has_children?
    children.any?
  end
  
  def root?
    parent.nil?
  end
  
  def plain_content
    Nokogiri::HTML(content).text[0..150]<<"..." if content.present?
  end
  
  validates_presence_of :title, :content
end
