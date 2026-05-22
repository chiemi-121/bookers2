FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "testuser#{n}" } # ここを修正
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end