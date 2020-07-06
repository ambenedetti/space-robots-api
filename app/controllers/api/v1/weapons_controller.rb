class Api::V1::WeaponsController < ApplicationController
  def index
    @robot = Robot.find(params[:robot_id])
    @weapons = @robot.weapons
    render json: @weapons
  end

  def show
    @weapon = Weapon.find(params[:id])
    render json: @weapon
  end

  def create
    @weapon = Weapon.new(weapon_params)
    if @weapon.save
      render json: @weapon
    else
      render error: { error: "Weapon not created" }, status: 400
    end
  end

  def update
    @robot = Robot.find(params[:robot_id])
    @weapon = @robot.weapons.find(params[:id])
    if @weapon
      @weapon.update(weapon_params)
      render json: { message: "Weapon updated" }, status: 200
    else
      render error: { error: "Weapon not updated" }, status: 400
    end
  end

  def destroy
    @weapon = Weapon.find(params[:id])
    if @weapon
      @weapon.destroy
      render json: { message: "Weapon deleted" }, status: 200
    else
      render error: { error: "Weapon not updated" }, status: 400
    end
  end

  private
  def weapon_params
    params.require(:weapon).permit(:weapon_type, :robot_id, :serial_number)
  end
end
