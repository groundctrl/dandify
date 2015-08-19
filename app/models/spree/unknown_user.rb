module Spree
  class UnknownUser
    def id
      Spree.t('dandify.admin.unknown')
    end

    def email
      Spree.t('dandify.admin.unknown')
    end
  end
end
