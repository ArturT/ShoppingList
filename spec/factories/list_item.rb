FactoryGirl.define do
  factory :list_item do
    list
    item
    bought [true, false].sample
  end
end
