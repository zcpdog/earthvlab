class Page < ActiveRecord::Base
  belongs_to  :parent, foreign_key: :parent_id , class_name: :Page
  has_many    :children, foreign_key: :parent_id , class_name: :Page , dependent: :destroy
  has_many    :resumes
  has_many    :achievements
  scope :root, -> { where parent_id: nil }
  after_save :create_achievement 
  
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
  
  def create_achievement
    if is_achievement and Achievement.find_by(page_id: self.id).nil?
      Achievement.create(title: self.title, content: self.content, page_id: self.id)
    end
  end
end
