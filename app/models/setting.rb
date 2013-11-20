class Setting < ActiveRecord::Base
  belongs_to :page
  def name_enum
    ['resume']
  end
  validates_presence_of :name, :page
  validates :page, uniqueness: true
  
  def self.used_pages
    Setting.all.map{|setting| setting.page}
  end
  
  def self.getName page
    setting = Setting.find_by page: page
    setting.name
  end
end
