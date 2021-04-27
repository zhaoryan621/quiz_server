# frozen_string_literal: true

module Api
  class AssessmentSessionPolicy < ApplicationPolicy
    def create?
      @user.user_role?
    end

    def mark_as_score?
      @user.supervisor_role?
    end
  end
end
