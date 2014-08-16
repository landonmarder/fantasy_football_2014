class Api::PlayersController < ApplicationController
  def index
    render json: Player.order_by_points
  end

  def show
    render json: Player.find(params[:id])
  end
end
