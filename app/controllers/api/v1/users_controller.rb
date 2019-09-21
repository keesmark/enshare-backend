module Api::V1
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    def index
      @users = User.all
      render json: @users
    end

    def show
      render json: @user
    end

    def new
      @user = User.new
      render json: @user
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render jason: @user
      else
        render json: @user.error
      end
    end

    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.error
      end
    end

    def destroy
      @user.destroy
      if @user.destroy
        head :no_content, status: :ok
      else
        render json: @user.error
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
