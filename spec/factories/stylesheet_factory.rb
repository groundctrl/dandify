FactoryGirl.define do
  factory :stylesheet, class: Spree::Stylesheet do
    style_raw '#main { display: none; }'
  end
end
