class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home; end

  def about; end

  def contact; end

  def dashboard; end

  def code_of_conduct; end

end
