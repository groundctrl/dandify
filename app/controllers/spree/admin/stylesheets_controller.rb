module Spree
  module Admin
    class StylesheetsController < ResourceController
      helper Spree::BaseHelper
      respond_to :html
      before_action :set_style, only: [:new, :create, :show, :edit, :update]

      def show
      end

      def new
      end

      def edit
      end

      def create
        @style.update style_params
        respond_with :admin, @style
      end

      def update
        @style.update style_params
        respond_with :admin, @style
      end

      private

        def set_style
          @style = Spree::Stylesheet.first_or_initialize
        end

        def style_params
          params.require(:stylesheet).permit(:style_raw)
        end

        def user_for_paper_trail
          current_spree_user
        end
    end
  end
end
