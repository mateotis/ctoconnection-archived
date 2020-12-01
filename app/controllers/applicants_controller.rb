class ApplicantsController < ApplicationController

	skip_before_action :authenticate_user!, except: :dashboard

	protect_from_forgery with: :null_session

	def new
		@applicant = Applicant.new
	end

	def create
		@applicant = Applicant.new(applicant_params)
		if @applicant.save
			flash[:notice] = 'Thanks for applying!'
			redirect_to root_url
		else
			render :new
		end
	end

	def applicant_params
		params.require(:applicant).permit(:first_name, :last_name, :email, :linkedin_url)
	end

end
