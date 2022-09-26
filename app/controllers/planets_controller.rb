class PlanetsController < ApplicationController

    def index
        render json: Planet.all, status: :ok
    end
end
