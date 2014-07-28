module Spree
  class StylesheetVersion < PaperTrail::Version
    belongs_to :user, foreign_key: 'whodunnit'
  end
end
