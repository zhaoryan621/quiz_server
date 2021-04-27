# frozen_string_literal: true

json.extract! quiz,
              :id,
              :title,
              :created_at,
              :updated_at
json.questions questions, partial: 'api/questions/question', as: :question
