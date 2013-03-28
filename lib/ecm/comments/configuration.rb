require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module Comments
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :input_name_css_classes
      @@input_name_css_classes = nil

      mattr_accessor :input_email_css_classes
      @@input_email_css_classes = nil

      mattr_accessor :input_homepage_css_classes
      @@input_homepage_css_classes = nil

      mattr_accessor :input_content_css_classes
      @@input_content_css_classes = nil
    end
  end
end

