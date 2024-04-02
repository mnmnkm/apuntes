class WordCommentsController < ApplicationController
    
  def create
    word = Word.find(params[:word_id])
    comment = current_user.word_comments.new(word_comment_params)
    comment.word_id = word.id
    comment.save
    redirect_to words_path
  end
  
  def destroy
    WordComment.find(params[:id]).destroy
    redirect_to words_path
  end

  private

  def word_question_params
    params.require(:word_comment).permit(:comment)
  end

end
