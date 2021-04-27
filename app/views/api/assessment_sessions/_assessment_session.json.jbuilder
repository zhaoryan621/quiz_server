# frozen_string_literal: true

json.extract! assessment_session,
              :id,
              :answer,
              :score,
              :created_at,
              :updated_at
json.question do
  json.partial! 'api/questions/question', locals: { question: assessment_session.question }
end
