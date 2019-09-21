module Api::V1
  class GearsController < ApplicationController
    before_action :set_gear, only: [:show, :edit, :update, :destroy]
    def index
      @gears = Gear.all.order(created_at: :desc)

      render json: @gears
    end

    def show
      render json: @gear
    end

    def create
      @gear = Gear.new(gear_params)
      if @gear.save
        render json: @gear
      else
        render json: @gear.errors
      end
    end

    def update
      if @gear.update(gear_params)
        render json: @gear
      else
        render json: @gear.error
      end
    end

    def destroy
      @gear.destroy
      if @gear.destroy
        head :no_content, status: :ok
      else
        render json: @gear.error
      end
    end

    private

    def gear_params
      params.require(:gear).permit(:title, :amazonUrl, :imgUrl, :content)
    end

    def set_gear
      @gear = Gear.find(params[:id])
    end
  end
end
