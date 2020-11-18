class ApplicationController < ActionController::Base
  include Auth
  include RoleChecker

  protect_from_forgery with: :exception

  before_action :authenticate_user!
end
