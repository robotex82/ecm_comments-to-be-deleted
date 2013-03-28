ActiveAdmin.register Ecm::Comments::Comment do
  actions :all, :except => [:edit]


  menu :label => Ecm::Comments::Comment.model_name.human(:count => Ecm::Comments::Comment.count)

  scope :all
  scope :spam
  scope :offensive

  action_item :only => :show do
    if ecm_comments_comment.spam?
      link_to I18n.t('ecm.comments.actions.unspam'), is_not_spam_admin_ecm_comments_comment_path(ecm_comments_comment)
    else
      link_to I18n.t('ecm.comments.actions.spam'), is_spam_admin_ecm_comments_comment_path(ecm_comments_comment)
    end
  end

  action_item :only => :show do
    if ecm_comments_comment.offensive?
      link_to I18n.t('ecm.comments.actions.unoffensive'), is_not_offensive_admin_ecm_comments_comment_path(ecm_comments_comment)
    else
      link_to I18n.t('ecm.comments.actions.offensive'), is_offensive_admin_ecm_comments_comment_path(ecm_comments_comment)
    end
  end

  member_action :is_spam do
    Ecm::Comments::Comment.find(params[:id]).spam!
    redirect_to(:back)
  end

  member_action :is_offensive do
    Ecm::Comments::Comment.find(params[:id]).offensive!
    redirect_to(:back)
  end

  member_action :is_not_spam do
    Ecm::Comments::Comment.find(params[:id]).not_spam!
    redirect_to(:back)
  end

  member_action :is_not_offensive do
    Ecm::Comments::Comment.find(params[:id]).not_offensive!
    redirect_to(:back)
  end

  form do |f|
    f.inputs do
      f.input :ecm_comments_comment_state
      f.input :name, :input_html => { :readonly => true, :class => :readonly }
      f.input :email, :input_html => { :readonly => true, :class => :readonly }
      f.input :homepage, :input_html => { :readonly => true, :class => :readonly }
      f.input :content, :input_html => { :readonly => true, :class => :readonly }
    end

    f.buttons
  end

  index :title => Ecm::Comments::Comment.model_name.human(:count => Ecm::Comments::Comment.count) do
    column :commentable
    column :name
    column :email, :sortable => :email do |comment|
      mail_to comment.email unless comment.email.blank?
    end
    column :homepage, :sortable => :homepage do |comment|
        link_to comment.homepage, comment.homepage unless comment.homepage.blank?
      end
    column :content_length
    column :comment_state
    column :created_at

    default_actions
  end

  show do
    attributes_table do
      row :commentable
      row :name
      row :email do |comment|
        mail_to comment.email unless comment.email.blank?
      end
      row :homepage do |comment|
        link_to comment.homepage, comment.homepage unless comment.homepage.blank?
      end
      row :client_ip
      row :comment_state
      row :created_at
      row :updated_at
    end

    panel Ecm::Comments::Comment.human_attribute_name(:content) do
      div do
        ecm_comments_comment.content
      end
    end
  end
end if defined?(ActiveAdmin)
