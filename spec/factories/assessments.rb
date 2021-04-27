# frozen_string_literal: true

FactoryBot.define do
  factory :assessment do
    association :user
    association :quiz
  end
end
