class Resume < ActiveRecord::Base
  belongs_to :user
  belongs_to :page
  validates_presence_of :user, :page, :title, :content
end
