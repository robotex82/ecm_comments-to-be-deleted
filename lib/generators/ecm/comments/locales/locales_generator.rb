module Ecm
  module Comments
    module Generators
      class LocalesGenerator < ::Rails::Generators::Base
        source_root File.expand_path('../templates', __FILE__)
        desc "Installs the needed locales"

        
        def generate_locales
          copy_file "ecm.comments.en.yml", "config/locales/ecm.comments.en.yml"
          copy_file "ecm.comments.de.yml", "config/locales/ecm.comments.de.yml"
        end           
      end
    end
  end
end

