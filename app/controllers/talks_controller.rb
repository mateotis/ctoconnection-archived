class TalksController < ApplicationController

    def upcoming_events
        @talks = Talk.all
    end

    def new; end

    def show
        @talk = Talk.find(params[:id])
    end

    def create; 
        @talk = Talk.new(talk_params)

        @talk.save
        redirect_to @talk
    end

    private def talk_params
        params.require(:talk).permit(:title, :description, :start_time, :end_time)
    end

end
