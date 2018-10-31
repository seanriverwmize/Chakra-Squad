FactoryBot.define do
  sequence(:name) { |n| "product#{n}"}
  sequence(:description) { |n| "product description#{n}"}
  factory :product, class: Product do
    name
    description
    price {500}
  end

end
