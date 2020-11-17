class ApplicantsController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def new; end

end
