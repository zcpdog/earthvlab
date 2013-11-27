RailsAdmin.config do |config|
  config.authorize_with :cancan
  
  config.main_app_name = [' 北京大学地球科学虚拟仿真实验教学中心', '后台管理']
  config.model Page do
    label '页面' 
    label_plural '页面' 
    edit do
      field :title do
        label "标题"
      end
      field :parent do
        label "所属页面"
      end
      field :is_achievement do
        label "加入最新成果展示"
      end
      field :content, :ck_editor do
        label "内容"
      end
    end
    list do
      field :title
      field :parent
      field :created_at
      field :updated_at
    end
  end
  
  config.model Resume do
    label '简历' 
    label_plural '简历' 
    edit do
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
    list do
      field :user
      field :created_at
      field :updated_at
    end
  end
  
  config.model News do
    label "新闻"
    label_plural "新闻"
    edit do
      include_all_fields
      field :content, :ck_editor
      field :thumb, :paperclip
    end
    list do
      field :thumb
      field :title
      field :created_at
      field :updated_at
    end
  end
  
  config.model Achievement do
    label "成果"
    label_plural "成果"
    edit do
      include_all_fields
      field :content, :ck_editor
      field :thumb, :paperclip
    end
    list do
      field :thumb
      field :title
      field :created_at
      field :updated_at
    end
  end
  
  config.model Info do
    label "通知"
    label_plural "通知"
    edit do
      include_all_fields
      field :content, :ck_editor
      field :thumb, :paperclip
    end
    list do
      field :thumb
      field :title
      field :created_at
      field :updated_at
    end
  end
  
  config.model Refer do
    label "国际行业资讯"
    label_plural "国际行业资讯"
    edit do
      field :title
      field :content, :ck_editor
      field :thumb, :paperclip
    end
    list do
      field :thumb
      field :title
      field :created_at
      field :updated_at
    end
  end
  
  config.model User do
    label_plural "用户"
    label "用户"
    edit do
      field :name do
        label "姓名"
      end
      field :email do
        label "邮箱"
      end
      field :title do 
        label "职务"
      end
      field :role do
        label "系统角色"
      end
      field :password, :password do
        label "密码"
      end
    end
    
    list do
      field :name do
        label "姓名"
      end
      field :email do
        label "邮箱"
      end
      field :title do 
        label "职务"
      end
      field :role do
        label "系统角色"
      end
      field :created_at
      field :updated_at
    end
  end
  
  config.model Gallery do
    label_plural "画廊"
    label "图片"
    edit do
      field :title
      field :avatar, :paperclip
      field :show
    end
  end
  
  config.model Link do
    label_plural "友情链接"
    label "友情链接"
    edit do
      field :name
      field :url
    end
  end
  
  config.model Setting do
    label_plural "设置"
    label "设置"
    edit do
      field :name
      field :page
    end
  end

end