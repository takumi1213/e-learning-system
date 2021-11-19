class AnswersController < ApplicationController
  include AnswersHelper

  def new
    @answer = Answer.new
    @lesson = Lesson.find(params[:lesson_id])

    @lesson.category.words.each do |word|
      unless @lesson.answers.where(word: word).exists?
        @word = word
        break
      end
    end

    if @word.nil?
      @lesson.update_attribute(:result, "Learned")
      redirect_to @lesson
    end
  end

  def create
    @answers = Answer.new(ans_params)
    @lesson = Lesson.find(@answers.lesson_id)

    if answer_count(@lesson) == total_words(@lesson.category_id)
      if @lesson.update_attribute(:result, "Learned")
        redirect_to _path
      end
    end

    if @answers.save #saves the date into DB
      flash[:success] = "Answer Saved!"
      redirect_back(fallback_location: root_path)
    else
      flash[:warning] = "Failed to Save Answer!"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def ans_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end

end
