FactoryGirl.define do
  factory :stylesheet, class: Spree::Stylesheet do |f|
    style_raw '#main { display: none; }'
  end
end
