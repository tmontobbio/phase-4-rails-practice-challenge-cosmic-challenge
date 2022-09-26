class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def invalid_record arg
    render json: {errors: arg.record.errors.full_messages}, status: :unprocessable_entity
  end

  def record_not_found arg
    render json: {error: "#{arg.model} not found"}, status: :not_found
  end
end
