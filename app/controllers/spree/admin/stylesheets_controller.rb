module Spree
  module Admin
    class StylesheetsController < ResourceController
      def show
        @style = Spree::Stylesheet.first_or_initialize
      end
    end
  end
end
