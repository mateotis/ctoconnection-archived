class TalksController < ApplicationController

    skip_before_action :authenticate_user!, except: :dashboard

    protect_from_forgery with: :null_session

    def new
        @talk = Talk.new
    end

    def upcoming_events
        @talks = Talk.all
    end

    def show
        @talk = Talk.find(params[:id])
    end

    def create
        @talk = Talk.new(talk_params)
        if @talk.save
            redirect_to root_url
        else
            render :new
        end
    end

    def talk_params
        params.require(:talk).permit(:title, :description, :start_time, :end_time)
    end

end
