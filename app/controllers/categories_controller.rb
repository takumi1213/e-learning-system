class CategoriesController < ApplicationController
  before_action :logged_in_user, only:[:create,:destroy,:edit]
  before_action :admin

  def index
   @categories = Category.all.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created!!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category updated!!"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Successfully deleted"
    redirect_back(fallback_location: request.referer)
  end

  private
  def category_params
    params.require(:category).permit(:title,:description)
  end
end

