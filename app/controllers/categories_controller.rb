class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: category_params[:name])

    if @category.save
      redirect_to categories_path
    else
      flash[:notice] = "That's an invalid category..."
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

    def category_params
      params.require(:category).permit(:id, :name)
    end

end
