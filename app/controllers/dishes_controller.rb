class DishesController < ApplicationController

    before_action :find_dish, only: [:show, :edit, :update, :destroy, :add_getter, :add_poster]
    
    def index
        @dishes = Dish.all
    end

    def show
    end

    def new
        @dish = Dish.new
    end

    def create
        @dish = Dish.new(sanitized_params)
        byebug
        if @dish.save
            redirect_to dish_path(@dish)
        else
            render new_dish_path
        end
    end

    def edit
        render new_dish_path
    end

    def update
        if @dish.update(sanitized_params)
            redirect_to dish_path(@dish)
        else
            render new_dish_path
        end
    end

    def destroy
        @dish.destroy
        redirect_to dishes_path
    end

    def sort
        @dishes = Dish.all
        @dishes = @dishes.sort_by {|dish| dish.ingredients.length}.reverse
        render :index
    end

    def add_getter
        render :add
    end

    def add_poster
        # byebug
        ingredient = Ingredient.find(sanitized_ingredients[:ingredient_id])
        quantity = sanitized_ingredients[:ingredient_quantity].to_i
        @dish.add_ingredient(ingredient, quantity)

        redirect_to dish_path(@dish)
    end

    private

    def find_dish
        @dish = Dish.find(params[:id])
    end

    def sanitized_params
        params.require(:dish).permit(:name, :meal_type, :user_id)
    end

    def sanitized_ingredients
        params.require(:dish).permit(:ingredient_id, :ingredient_quantity)
    end

end
