# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Lorem.characters(number: 10) }
    last_name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    password { 'test_password' }
  end
end
