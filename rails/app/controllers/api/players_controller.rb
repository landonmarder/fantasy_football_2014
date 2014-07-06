class Api::PlayersController < ApplicationController
  def index
    render json: Player.all
  end

  def show
    render json: Player.find(params[:id])
  end
end
