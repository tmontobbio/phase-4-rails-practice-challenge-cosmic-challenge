class ScientistsController < ApplicationController

    def index
       render json: Scientist.all, status: :ok 
    end

    # find will throw an exception
    def show
        scientist = Scientist.find_by(id:params[:id])
          if scientist
            render json: scientist, status: :ok, serializer: ScientistPlanetsSerializer
          else
            render json: { error: "Scientist not found" }, status: :not_found
          end
    end

    def create
        new_scientist = Scientist.create!(scientist_params)
        render json: new_scientist, status: :created
    end

    def update
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = Scientist.find(params[:id])
        render json: scientist.destroy, status: :ok
    end

    private

    def scientist_params
      params.permit(:name, :field_of_study, :avatar)
    end
end
