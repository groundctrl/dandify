module Spree
  class StylesheetsController < Spree::StoreController
    before_filter :set_response_format

    def show
      @style = Spree::Stylesheet.load_style
    end

    private

      def set_response_format
        request.format = :css
      end
  end
end
