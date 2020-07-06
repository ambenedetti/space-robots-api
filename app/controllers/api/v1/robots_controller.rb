class Api::V1::RobotsController < ApplicationController
  before_action :set_robot, only: [:show, :update, :destroy]

  def index
    @robots = Robot.all
    @robots = Robot.where(name: params[:name]) if params[:name]
    @robots = Robot.joins(:weapons).where(weapons: { name: params[:weapon] }) if params[:weapon]
    render json: @robots
  end

  def show
    set_robot
    render json: @robot, include: [:weapons, :armors]
  end

  def create
    @robot = Robot.new(robot_params)
    if @robot.save
      render json: @robot
    else
      render error: { error: "unable to create robot" }, status: 400
    end
  end

  def update
    set_robot
    if @robot
      @robot.update(robot_params)
      render json: { message: "Robot updated" }, status: 200
    else
      render error: { error: "unable to update robot" }, status: 400
    end
  end

  def destroy
    set_robot
    if @robot
      @robot.destroy
      render json: { message: "robot deleted" }, status: 200
    else
      render error: { error: "unable to delete robot" }, status: 400
    end
  end

  private

  def robot_params
    params.require(:robot).permit(:name, :robot_type, :serial_number)
  end

  def set_robot
    @robot = Robot.find(params[:id])
  end
end
