class AnswerFavoritesController < ApplicationController
    
  def create
    @question = question.find(params[:word_id])
    @answer = answer.find(params[:word_id])
    answer_favorite = current_user.answer_favorites.new(answer_id: @answer.id)
    answer_favorite.save
  end

  def destroy
    @question = question.find(params[:word_id])
    @word = Word.find(params[:word_id])
    answer_favorite = current_user.answer_favorites.find_by(word_id: @answer.id)
    answer_favorite.destroy
  end
  
end
