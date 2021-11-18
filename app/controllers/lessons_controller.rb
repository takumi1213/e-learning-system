class LessonsController < ApplicationController
  def index
    if params[:filter] == "Learned"
      @categories = current_user.categories.where.not(lessons: {result: nil})
    elsif params[:filter] == "Not Learned"
      @categories = Category.left_outer_joins(:lessons)
                          .where.not(id: current_user.categories
                          .where.not(lessons: {result: nil}))
    else
      @categories = Category.all
    end
    @categories = @categories.paginate(page: params[:page])
  end
end
