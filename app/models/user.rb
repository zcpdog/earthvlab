class User < ActiveRecord::Base
  devise :database_authenticatable,:recoverable, 
    :rememberable, :trackable, :validatable
  has_many :resumes
  scope :with_title, ->(title) { where(title: title)}
  def role_enum
    ['管理员', '教职工']
  end
  
  TITLES = ['院士', '教授', '副教授', '讲师及助理', '校外兼职', '校外双聘']
  
  def title_enum
    TITLES
  end
  
  def admin?
    role.eql? "admin" or role.eql? "管理员"
  end
  
  def teacher?
    role.eql? "teacher" or role.eql? "教职工"
  end
  
  validates_presence_of :role
end
