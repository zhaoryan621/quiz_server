# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    association :quiz

    question { Faker::Lorem.sentence(word_count: 5) }
    correct_answer { Faker::Lorem.sentence(word_count: 5) }
  end
end
