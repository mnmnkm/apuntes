class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    
    if params[:post]
      @question.is_active = true
      if @question.save(context: :publicize)
        flash[:notice] = "投稿に成功しました。"
        redirect_to questions_path
      else
        flash.now[:alert] = "投稿に失敗しました。"
        render :new
      end
    else
      @question.is_active = false
      if @question.save
        flash[:notice] = "質問を下書き保存しました。"
        redirect_to user_path(current_user.id)
      else
        flash.now[:alert] = "質問を下書き保存できませんでした。"
        render :new
      end
    end
  end

  def index
    # @questions = Question.all.order(id: :desc)
    @is_active_questions = Question.where(is_active: true, is_solution: true).order(id: :desc)
    @not_active_questions = Question.where(is_active: true, is_solution: false).order(id: :desc)
    @questions = Question.where(is_active: true).order(id: :desc)

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
    
    if params[:publicize_draft]
      question.is_active = true
      if question.update(question_params)
        flash[:notice] = "記事を公開しました。"
        redirect_to questions_path
      else
        question.is_active = false
        render :edit, alert: "記事を公開できませんでした。"
      end
    elsif params[:update_question]
      question.is_active = true
      if question.update(question_params)
        flash[:notice] = "記事を更新しました。"
        redirect_to questions_path
      else
        render :edit, alert: "記事を更新できませんでした。"
      end
    else
      question.is_active = false
      if question.update(question_params)
        flash[:notice] = "下書き記事を更新しました。"
        redirect_to user_path(current_user.id)
      else
        render :edit, alert: "下書き記事を更新できませんでした。"
      end
    end

  end
  
  def destroy
    question = Question.find(params[:id])  
    question.destroy 
    if request.referer&.include?('/users/')
      redirect_to user_path(current_user.id)
    elsif request.referer&.include?('/questions')
      redirect_to questions_path  
    else
      redirect_to root_path
    end
  end
  
  
  private
  def question_params
    params.require(:question).permit(:title, :body, :is_solution)
  end
end
