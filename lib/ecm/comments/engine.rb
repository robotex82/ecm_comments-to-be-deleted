module Ecm
  module Comments
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::CommentsHelper)
      end

      # active admin
      initializer :ecm_comments_engine do
        ::ActiveAdmin.setup do |active_admin_config|
          active_admin_config.load_paths += Dir[File.dirname(__FILE__) + '/active_admin']
        end
      end if defined?(::ActiveAdmin)
    end
  end
end

