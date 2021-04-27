# frozen_string_literal: true

json.assessment do
  json.partial! 'api/assessments/assessment', assessment: assessment
end
