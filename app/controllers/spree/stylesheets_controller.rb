module Spree
  class StylesheetsController < Spree::StoreController
    def show
      @style = Spree::Stylesheet.load_style
      render css: @style
    end
  end
end
