class AnswerFavoritesController < ApplicationController
    
  def create
    @question = Question.find(params[:question_id])
    @answer = QuestionAnswer.find(params[:question_answer_id])
    answer_favorite = current_user.answer_favorites.new(question_answer_id: @answer.id)
    answer_favorite.save
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = QuestionAnswer.find(params[:question_answer_id])
    answer_favorite = current_user.answer_favorites.find_by(question_answer_id: @answer.id)
    answer_favorite.destroy
  end
  
end
