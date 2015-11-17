FactoryGirl.define do
  factory :item do
    sequence(:sku_id) { |n| n }
    sequence(:supplier_external_id) { |n| n }

    trait :full do
      association :supplier
    end
  end
end
