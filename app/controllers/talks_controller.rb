class TalksController < ApplicationController

    skip_before_action :authenticate_user!, except: :dashboard

    def upcoming_events
        @talk = Talk.all
    end

    def new_events

    end

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
