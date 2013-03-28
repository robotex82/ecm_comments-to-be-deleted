module Ecm
  module Comments
    class Routing
      def self.routes(router, options = {})
        options.reverse_merge!(
          { :comment_actions => [:create] }
        )

        router.resources :ecm_comments_comments, :only => options[:comment_actions], :controller => 'ecm/comments/comments'
      end
    end
  end
end

