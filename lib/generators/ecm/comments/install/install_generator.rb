module Ecm
  module Comments
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "Installs the ECM Comments module"
        class_option :skip_migration, :type => :boolean, :default => false
        
        def generate_active_admin
          generate 'ecm:comments:active_admin'
        end              
        
        def generate_locales
          generate 'ecm:comments:locales'
        end
        
        def generate_migrations
          unless options[:skip_migration]
            generate 'ecm:comments:migrations'
          end  
        end
        
        def generate_models
          generate 'ecm:comments:models'
        end
      end
    end
  end
end

