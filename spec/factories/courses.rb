FactoryBot.define do
  factory :course do
    duration { Faker::Number.number(10) }

    sequence(:title) { |n| "title#{n}" }
  end
end
