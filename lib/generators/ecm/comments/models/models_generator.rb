module Ecm
  module Comments
    module Generators
      class ModelsGenerator < Rails::Generators::Base
        desc "Generates the models"
             
        source_root File.expand_path('../templates', __FILE__)
      
        def generate_models
          copy_file "comment.rb", "app/models/ecm/comments/comment.rb"
          copy_file "comment_state.rb", "app/models/ecm/comments/comment_state.rb"
          copy_file "comments.rb", "app/models/ecm/comments.rb"
        end      
      end
    end
  end
end        
