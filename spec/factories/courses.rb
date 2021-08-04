FactoryBot.define do
  factory :course do
    duration { Faker::Number.number(10) }
    association :category_name

    sequence(:title) { |n| "title#{n}" }
  end
end
