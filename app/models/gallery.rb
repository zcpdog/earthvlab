class Gallery < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "960x396#", :thumb => "96x39>" },
                    :url => "/ckeditor_assets/galleries/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/galleries/:id/:style_:basename.:extension"
   
  scope :visiable, ->{ where(show: true) }
  validates_attachment_size :avatar, :less_than => 10.megabytes
  validates_attachment_presence :avatar
  validates_presence_of :title
end
