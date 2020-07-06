class Api::V1::ArmorsController < ApplicationController
  def index
    @robot = Robot.find(params[:robot_id])
    @armors = @robot.armors
    render json: @armors
  end

  def show
    @armor = Armor.find(params[:id])
    render json: @armor
  end

  def create
    @armor = Armor.new(armor_params)
    if @armor.save
      render json: @armor
    else
      render error: { error: "Armor not created" }, status: 400
    end
  end

  def update
    @robot = Robot.find(params[:robot_id])
    @armor = @robot.armors.find(params[:id])
    if @armor
      @armor.update(armor_params)
      render json: { message: "Armor updated" }, status: 200
    else
      render error: { error: "Armor not updated" }, status: 400
    end
  end

  def destroy
    @armor = Armor.find(params[:id])
    if @armor
      @armor.destroy
      render json: { message: "Armor deleted" }, status: 200
    else
      render error: { error: "Armor not updated" }, status: 400
    end
  end

  private
  def armor_params
    params.require(:armor).permit(:armor_type, :robot_id, :serial_number)
  end
end
