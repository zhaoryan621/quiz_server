# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  class NoPermissionException < RuntimeError; end
  rescue_from Pundit::NotAuthorizedError, with: :render_service_permission_error

  protected

  def render_service_permission_error
    render status: :forbidden, json: { errors: ['You have no permission.'] }
  end
end
