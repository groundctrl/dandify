FactoryGirl.define do
  factory :stylesheet, class: Spree::Stylesheet do
    style_raw '#main { display: none; }'
  end

  factory :another_stylesheet, class: Spree::Stylesheet do
    style_raw 'body { display: none; }'
  end
end
