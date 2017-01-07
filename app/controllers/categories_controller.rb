class CategoriesController < ApplicationController
    
  def new
    @category = Category.new  
  end
  
  def index
    @all_categories = Category.all  
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You created new category."
      redirect_to categories_path
    else
      render 'new'    
    end  
  end
  
  def show
    @category = Category.find(params[:id])  
  end    
  
  private
  def category_params
    params.require(:category).permit(:name)  
  end
end

