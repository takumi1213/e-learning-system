class WordsController < ApplicationController
  
  def index
    @word = Word.paginate(page: params[:page], per_page: 5 )
  end

  def show
    @choices = @user.choices
    @words = @user.words
  end

  def new
    @word = Word.new
    3.times{ @word.choices.build }
  end
  
  def create
    @word = Word.create(word_params)
    if @word.save
      flash[:success] = "finished"
      redirect_to categories_path
    else
      flash[:danger] = @word.errors.full_messages.to_sentence #this will return the full message for the errors
      redirect_back(fallback_location: request.referer)
    end
   end
  
  def edit
    @word = Word.find(params[:id])
  end
  
  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to word_path(@word), notice: '更新しました'
    else
      render :edit
    end
  end
  

  def destroy
    Word.find(params[:id]).destroy
    redirect_to root_url
  end

  private
  
  def word_params
    params.require(:word).permit(
        :category_id,
        :word,
        choices_attributes: [:id,
                          :word_id,
                          :choice,
                          :correct,]
      )
  end
  

end
