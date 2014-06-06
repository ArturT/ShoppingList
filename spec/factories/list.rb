FactoryGirl.define do
  factory :list do
    sequence(:name) { |n| "List #{n}" }
    user
  end
end
