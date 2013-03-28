module Ecm
  module Comments
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "Generates the intializer"

        source_root File.expand_path('../templates', __FILE__)

        def generate_intializer
          copy_file "ecm_comments.rb", "config/initializers/ecm_comments.rb"
        end
      end
    end
  end
end

