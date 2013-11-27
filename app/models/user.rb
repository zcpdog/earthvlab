class User < ActiveRecord::Base
  devise :database_authenticatable,:recoverable, 
    :rememberable, :trackable, :validatable
  has_many :resumes
  scope :with_title, ->(title) { where(title: title)}
  def role_enum
    ['管理员', '教职工']
  end
  
  TITLES = ['院士', '长江学者', '千人研究员', '百人研究员', '教授', '副教授', '高级工程师', '讲师', '工程师', '实验师']
  
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
