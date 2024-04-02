class QuestionAnswersController < ApplicationController
    
  def create
    question = Question.find(params[:question_id])
    answer = current_user.question_answers.new(question_answer_params)
    answer.question_id = question.id
    answer.save
    redirect_to question_path(params[:question_id])
  end
  
  def destroy
    QuestionAnswer.find(params[:id]).destroy
    redirect_to question_path(params[:question_id])
  end

  private

  def question_answer_params
    params.require(:question_answer).permit(:answer)
  end    

    
end
