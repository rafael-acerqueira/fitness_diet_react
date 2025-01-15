class MeasuresController < ApplicationController

  def create
    measure = Measure.create(measure_params.merge(user_id: params[:user_id]))
    if measure.save
      render json: measure, status: :created
    else
      render json: { errors: measure.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def measure_params
    params.require(:measure).permit(:weight, :cincture)
  end
end
