class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, 
    :rememberable, :trackable, :validatable
  has_many :resumes
  
  def role_enum
    ['admin', 'teacher']
  end
  
  def admin?
    role.eql? "admin"
  end
  
  def teacher?
    role.eql? "teacher"
  end
  
  validates_presence_of :role
   
end
