FactoryBot.define do
  sequence(:email) { |n| "usernumber#{n}@example.com" }
  sequence(:password) { |n| "1234567#{n}"}
  factory :user, class: User do
    first_name { "Paul" }
    last_name { "Walker" }
    email
    password
    admin { false }
  end
  factory :admin, class: User do
    first_name { "Admin" }
    last_name { "User" }
    email
    password
    admin { true }
  end
end
