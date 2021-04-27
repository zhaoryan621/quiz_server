# frozen_string_literal: true

FactoryBot.define do
  factory :assessment_session do
    association :assessment
    association :question

    answer { Faker::Lorem.sentence(word_count: 5) }
  end
end
