class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.where(is_active: true).order(id: :desc)
    
    @total_count = @articles.count
    
    if @user.id == current_user.id
      @not_active_articles = @user.articles.where(is_active: false).order(id: :desc)
      # 先に下書きを表示する
      @articles = @not_active_articles + @articles
    end
    
    @words = @user.words.where(is_active: true).order(id: :desc)
    @total_count += @words.count
    
    if @user.id == current_user.id
      @not_active_words = @user.words.where(is_active: false).order(id: :desc)
      # 先に下書きを表示する
      @words = @not_active_words + @words
    end
    
    @questions = @user.questions.where(is_active: true).order(id: :desc)
    @total_count += @questions.count
    
    if @user.id == current_user.id
      @not_active_questions = @user.questions.where(is_active: false).order(id: :desc)
      # 先に下書きを表示する
      @questions = @not_active_questions + @questions
    end
    
    @word_comment = WordComment.new 
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :spanish_level, :introduction, :certification)
  end
  
end
