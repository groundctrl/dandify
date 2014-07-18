module Spree
  module Admin
    class StylesheetsController < BaseController
      helper Spree::BaseHelper

      respond_to :html

      before_action :set_style

      def create
        update_action :new
      end

      def update
        update_action :edit
      end

      def restore
        response = rollback_version

        redirect_to admin_stylesheets_path, flash: {
          response => Spree.t("dandify.restore.#{response}")
        }
      end

      private

      def rollback_version
        @style.versions.last.reify.save!
        :success
      rescue
        :error
      end

      def update_action(type)
        if @style.update(style_params)
          redirect_to admin_stylesheets_path, flash: {
            success: Spree.t("dandify.#{type}.success")
          }
        else
          render type
        end
      end

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
