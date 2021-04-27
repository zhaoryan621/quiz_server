# frozen_string_literal: true

json.extract! assessment,
              :id,
              :score,
              :created_at,
              :updated_at
json.user do
  json.partial! 'api/users/user', locals: { user: assessment.user }
end
json.quiz do
  json.partial! 'api/quizzes/quiz', locals: { quiz: assessment.quiz }
end
json.by_teacher do
  json.partial! 'api/users/user', locals: { user: assessment.user }
end
