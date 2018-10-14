FactoryBot.define do
  sequence(:name) { |n| "product#{n}"}
  sequence(:description) { |n| "product description#{n}"}
  factory :product do
    name
    description
  end

end
