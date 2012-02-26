ActiveAdmin.register Ecm::Comments::CommentState do
  menu :label => Ecm::Comments::CommentState.human_name(:count => Ecm::Comments::CommentState.count)
  
  index :title => Ecm::Comments::CommentState.human_name(:count => Ecm::Comments::CommentState.count) do
    column :name
    column :comments_count

    default_actions
  end
  
  show :title => :name do
    attributes_table do
      row :identifier
      row :description
      row :comments_count
    end
  end
end
