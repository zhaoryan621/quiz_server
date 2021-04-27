# frozen_string_literal: true

FactoryBot.define do
  factory :quiz do
    association :creator, factory: :user

    title { Faker::Lorem.sentence(word_count: 5) }
  end
end
