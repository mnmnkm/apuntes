class WordsController < ApplicationController
  def new
    @word = Word.new
  end
  
  def create
    word = Word.new(word_params)
　　word.user_id = current_user.id
    if word.save
      flash[:notice] = "投稿に成功しました。"
    　redirect_to words_path
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @words = Word.all
    # @word = Word.find(params[:id])
    @word_comment = WordComment.new
  end
  
  def edit
    @word = Word.find(params[:id])
  end
  
  def update
    word = Word.find(params[:id])
    word.update(word_params)
    redirect_to words_path 
  end
  
  def destroy
    word = Word.find(params[:id])  
    word.destroy 
    redirect_to words_path
  end

  
  private
  def word_params
    params.require(:word).permit(:spanish, :japanese, :spanish_example, :japanese_example)
  end
end
