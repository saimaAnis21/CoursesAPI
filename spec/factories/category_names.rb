FactoryBot.define do
  factory :category_name do
    sequence(:name) { |n| "name#{n}" }
  end
end
