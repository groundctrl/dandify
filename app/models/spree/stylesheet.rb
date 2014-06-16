class Spree::Stylesheet < ActiveRecord::Base
  validates :style_raw, presence: true
end
