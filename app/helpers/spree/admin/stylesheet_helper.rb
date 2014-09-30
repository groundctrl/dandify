module Spree
  module Admin
    module StylesheetHelper
      def dandify_version_email(user)
        user.nil? ? Spree.t('dandify.admin.unknown') : user.email
      end
    end
  end
end
