module Spree
  class StylesheetsController < Spree::StoreController
    helper Spree::BaseHelper
    before_filter :set_response_format

    def new
      @style = Spree::Stylesheet.new
    end

    def create
    end

    def show
      @style = Spree::Stylesheet.load_style
    end

    private

    def set_response_format
      request.format = :css
    end
  end
end
