class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end
  
  def create
    question = Question.new(question_params)
    question.user_id = current_user.id
    if question.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to questions_path
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @questions = Question.all.order(id: :desc)
    # if params[:target] == "active_onliy"
    #   @questions = Question.where(is_active: true) # 公開のデータだけ取得
    # end
  end

  def show
    @question = Question.find(params[:id])
    @question_comment = QuestionComment.new
    @question_answer = QuestionAnswer.new
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    question = Question.find(params[:id])
    question.update(question_params)
    redirect_to questions_path 
  end
  
  def destroy
    question = Question.find(params[:id])  
    question.destroy 
    redirect_to questions_path  
  end
  
  
  private
  def question_params
    params.require(:question).permit(:title, :body, :is_active)
  end
end
