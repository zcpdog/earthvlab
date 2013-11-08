RailsAdmin.config do |config|
  config.authorize_with :cancan
  
  
  config.main_app_name = [' 北京大学地球科学虚拟仿真实验教学中心', '后台管理']
  config.model Page do
    label '页面' 
    label_plural '页面' 
    edit do
      field :title
      field :parent
      field :content, :ck_editor
    end
  end
  
  config.model Resume do
    label '简历' 
    label_plural '简历' 
    edit do
      field :title
      field :page
      configure :user do
        visible false
      end
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
      field :content, :ck_editor
    end
  end
  
  config.model News do
    label "新闻"
    label_plural "新闻"
    edit do
      include_all_fields
      field :content, :ck_editor
    end
  end
  
  config.model Achievement do
    label "成果"
    label_plural "成果"
    edit do
      include_all_fields
      field :content, :ck_editor
    end
  end
  
  config.model Info do
    label "通知"
    label_plural "通知"
    edit do
      include_all_fields
      field :content, :ck_editor
    end
  end
  
  config.model Refer do
    label "国际行业咨询"
    label_plural "国际行业咨询"
    edit do
      field :title
      field :content, :ck_editor
    end
  end
  
  config.model 'User' do
    label_plural "用户"
    label "用户"
    edit do
      field :email 
      field :password, :password
      field :role
    end
  end
  
  
  
end