class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  before_action :store_location
  
  def new
    @category = Category.new
  end
  
  def index
    @categories = Category.all
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category saved"
      redirect_to categories_url
    else
      render 'new_category'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Category saved."
      redirect_to categories_url
    else
      render 'edit_category'
    end
  end
  
  def destroy
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end
  
  private
  
    def find_category
      @category = Category.find(params[:id])
    end
    
    def category_params
      params.require(:category).permit(:name)
    end
    
end