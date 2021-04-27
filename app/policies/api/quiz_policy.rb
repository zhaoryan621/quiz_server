# frozen_string_literal: true

module Api
  class QuizPolicy < ApplicationPolicy
    def index?
      @user.user_role?
    end

    def show?
      @user.user_role?
    end

    def create?
      @user.supervisor_role?
    end
  end
end
