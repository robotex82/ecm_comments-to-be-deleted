module Ecm
  module Comments
    module Generators
      class ActiveAdminGenerator < Rails::Generators::Base
        desc "Generates the active admin files"
             
        source_root File.expand_path('../templates', __FILE__)
      
        def generate_models
          copy_file "comments.rb", "app/admin/ecm/comments/folders.rb"
          copy_file "comment_states.rb", "app/admin/ecm/comments/comment_states.rb"
        end      
      end
    end
  end
end        
