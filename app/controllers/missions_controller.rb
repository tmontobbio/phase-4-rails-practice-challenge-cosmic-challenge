class MissionsController < ApplicationController

    def create
        new_mission = Mission.create!(mission_params)
        render json: new_mission.planet, status: :created
    end

    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end
end
