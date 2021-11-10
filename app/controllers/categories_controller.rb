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
    else
      flash[:danger] = "Please input content"
    end
    redirect_to categories_path
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

