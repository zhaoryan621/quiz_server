# frozen_string_literal: true

class Quiz < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :questions, dependent: :destroy
end
