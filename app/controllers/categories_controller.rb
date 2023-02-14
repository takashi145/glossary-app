class CategoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(
      category_param.merge(user_id: current_user.id)
    )
    if @category.save
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_param)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
    def category_param
      params.require(:category).permit(:name)
    end
end
