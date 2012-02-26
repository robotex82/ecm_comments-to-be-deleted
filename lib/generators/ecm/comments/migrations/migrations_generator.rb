require 'rails/generators/migration'

module Ecm
  module Comments
    module Generators
      class MigrationsGenerator < ::Rails::Generators::Base
        include Rails::Generators::Migration
        source_root File.expand_path('../templates', __FILE__)
        desc "Installs the needed migrations"

        def self.next_migration_number(path)
          unless @prev_migration_nr
            @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
          else
            @prev_migration_nr += 1
          end
          @prev_migration_nr.to_s
        end

        def copy_migrations
          migration_template "create_ecm_comments_comments.rb", "db/migrate/create_ecm_comments_comments.rb"
          migration_template "create_ecm_comments_comment_states.rb", "db/migrate/create_ecm_comments_comment_states.rb"
        end         
      end
    end
  end
end

