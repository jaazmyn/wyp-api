class V1::PlantsController < ApplicationController
  def index
    p "in plants index"
    @plants = current_user.plants
    render json: @plants 
  end
end
