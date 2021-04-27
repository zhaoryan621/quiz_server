# frozen_string_literal: true

json.question do
  json.partial! 'api/questions/question', question: question
end
