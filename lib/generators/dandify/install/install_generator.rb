module Dandify
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :auto_run_migrations, type: :boolean, default: true

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=dandify'
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', "*= require spree/backend/dandify\n", before: /\*\//, verbose: true
      end

      def run_migrations
        res = ask('Would you like to run the migrations now? [Y/n]').downcase
        if ['', 'y'].include?(res)
          run 'bundle exec rake db:migrate'
        else
          logger 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
