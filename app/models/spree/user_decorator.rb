Spree::User.class_eval do
  has_many :editions,
           foreign_key: 'whodunnit',
           class_name: 'Spree::StylesheetVersion'
end
