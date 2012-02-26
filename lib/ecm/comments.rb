module Ecm
  module Comments
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::CommentsHelper)
      end  
    end
  end  
end
