module Api::V1
  class GearsController < ApplicationController
    def index
      @gears = Gear.all.order(created_at: :desc)

      render json: @gears
    end

    def create
      @gear = Gear.new(gear_params)
      if @gear.save
        render json: @gear
      else
        render json: @gear.errors
      end
    end

    def destroy; end

    private
    def gear_params
      params.require(:gear).permit(:title, :amazonUrl, :imgUrl, :content)
    end
  end
end