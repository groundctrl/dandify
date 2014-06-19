module Spree
  module Admin
    class StylesheetsController < ResourceController
      helper Spree::BaseHelper
      respond_to :html
      before_action :set_style, only: [:new, :show, :edit, :update, :destroy]

      def show
      end

      def new
      end

      def edit
      end

      def create
        @style = Spree::Stylesheet.new(style_params)
        @style.save
        respond_with @style
      end

      def update
        respond_with @fart.update(style_params)
      end

      private
        def set_style
          @style = Spree::Stylesheet.first_or_initialize
        end

        def style_params
          params[:fart]
        end
    end
  end
end
