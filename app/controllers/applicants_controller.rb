class ApplicantsController < ApplicationController

	def new
		@applicant = Applicant.new
	end

	def create
		@applicant = Applicant.new(applicant_params)
		if @applicant.save
			redirect_to :root
		else
			render :new
		end
	end

	def applicant_params
		params.require(:applicant).permit(:first_name, :last_name, :email, :linkedin_url)
	end

end
