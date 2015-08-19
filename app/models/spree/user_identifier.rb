module Spree
  class UserIdentifier
    delegate :id, to: :user

    def initialize(user)
      @user = user || UnknownUser.new
    end

    private

    attr_reader :user
  end
end
