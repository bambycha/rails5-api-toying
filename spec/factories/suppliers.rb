FactoryGirl.define do
  factory :supplier do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:external_id) { |n| "#{n}" }
  end
end
