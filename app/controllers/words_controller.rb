class WordsController < ApplicationController
  def new
    @word = Word.new
  end
  
  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
    
    if params[:post]
      @word.is_active = true
      if @word.save(context: :publicize)
        flash[:notice] = "単語を公開しました。"
        redirect_to words_path
      else
        flash.now[:alert] = "単語を公開できませんでした。"
        render :new
      end
    else
      @word.is_active = false
      if @word.save
        flash[:notice] = "単語を下書き保存しました。"
        redirect_to user_path(current_user.id)
      else
        flash.now[:alert] = "単語を下書き保存できませんでした。"
        render :new
      end
    end
  end

  def index
    # @words = Word.all.order(id: :desc)
    @words = Word.where(is_active: true).order(id: :desc)
    # @word = Word.find(params[:id])
    @word_comment = WordComment.new
  end
  
  def edit
    @word = Word.find(params[:id])
  end
  
  def update
    @user = current_user
    word = Word.find(params[:id])

    word.assign_attributes(word_params)
   
    if params[:publicize_draft]
      word.is_active = true
      if word.update(word_params)
        flash[:notice] = "単語を公開しました。"
        redirect_to words_path
      else
        word.is_active = false
        render :edit, alert: "単語を公開できませんでした。"
      end
    elsif params[:update_word]
      word.is_active = true
      if word.update(word_params)
        flash[:notice] = "単語を更新しました。"
        redirect_to words_path
      else
        render :edit, alert: "単語を更新できませんでした。"
      end
    else
      word.is_active = false
      if word.update(word_params)
        flash[:notice] = "下書き単語を更新しました。"
        redirect_to user_path(current_user.id)
      else
        render :edit, alert: "下書き単語を更新できませんでした。"
      end
    end

  
  end
  
  def destroy
    word = Word.find(params[:id])  
    word.destroy 
    if request.referer&.include?('/users/')
      redirect_to user_path(current_user.id)
    elsif request.referer&.include?('/words')
      redirect_to words_path  
    else
      redirect_to root_path
    end
  end
  
  private
  def word_params
    params.require(:word).permit(:spanish, :japanese, :spanish_example, :japanese_example)
  end
end
