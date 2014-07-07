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
        if @style.update style_params
          flash[:success] = Spree.t('dandify.new.success')
          redirect_to admin_stylesheets_path
        else
          render :new
        end
      end

      def update
        if @style.update style_params
          flash[:success] = Spree.t('dandify.edit.success')
          redirect_to admin_stylesheets_path
        else
          render :edit
        end
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
