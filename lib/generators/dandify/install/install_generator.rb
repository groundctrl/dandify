module Dandify
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :auto_run_migrations, type: :boolean, default: true

      def add_migrations
        run 'bundle exec rails generate paper_trail:install FROM=dandify'
        run 'bundle exec rake railties:install:migrations FROM=dandify'
      end
    end
  end
end
