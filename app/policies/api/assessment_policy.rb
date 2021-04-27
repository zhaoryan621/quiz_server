# frozen_string_literal: true

module Api
  class AssessmentPolicy < ApplicationPolicy
    def index?
      @user.user_role?
    end

    def show?
      index?
    end

    def create?
      index?
    end

    def complete?
      index?
    end
  end
end
