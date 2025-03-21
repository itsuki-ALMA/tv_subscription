class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @user = User.all
        render json: @user
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: @user, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        head :no_content
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :age)
    end
end
