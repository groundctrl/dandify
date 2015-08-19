module Spree
  module Admin
    module StylesheetHelper
      def dandify_version_email(user_id)
        user = if user_id.nil? || user_id == Spree.t('dandify.admin.unknown')
          UnknownUser.new
        else
          User.find(user_id)
        end

        user.email
      end

      def previous_versions
        PaperTrail::Version.all
      end
    end
  end
end
