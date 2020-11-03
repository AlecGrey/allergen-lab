class UsersController < ApplicationController

    before_action :find_user

    def show
    end

    def edit
    end

    def update
        # byebug
        @user.ingredients << Ingredient.find(params[:user][:ingredients])
        redirect_to user_path(@user)
    end

    def destroy
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

end
