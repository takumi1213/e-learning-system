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

  def create
    @category = Category.find_by_id(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)
    if @category.words.any?
      @lesson.save
      @action = Activity.create(actionable: Lesson.last, user_id: current_user.id)
      redirect_to new_lesson_answer_url(@lesson)
    else
      flash[:danger] = "There are no words in this category yet"
      redirect_to lessons_url
    end
  end
  
  def show
    @answers = Answer.where(lesson_id:params[:id])
  end
end
