# frozen_string_literal: true

module Api
  class QuestionPolicy < ApplicationPolicy
    def create?
      @user.supervisor_role?
    end
  end
end
