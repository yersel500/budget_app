class CategoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @categories = @user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @user = User.find(params[:user_id])
    @category = @user.categories.new(category_params)
    if @category.save
      flash[:notice] = 'The category was added successfully'
      redirect_to user_category_path(user_id: params[:user_id], id: @category.id)
    else
      flash[:alert] = "Couldn't create the recipe!"
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
