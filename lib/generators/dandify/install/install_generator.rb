module Dandify
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :auto_run_migrations, type: :boolean, default: true

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', "*= require spree/backend/dandify\n", before: /\*\//, verbose: true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=dandify'
      end

      def run_migrations
        run 'bundle exec rake db:migrate'
      end
    end
  end
end
