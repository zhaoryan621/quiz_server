# frozen_string_literal: true

json.assessment_session do
  json.partial! 'api/assessment_sessions/assessment_session', assessment_session: assessment_session
end
