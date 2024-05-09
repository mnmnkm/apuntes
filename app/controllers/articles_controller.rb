class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    
    if params[:post]
      @article.is_active = true
      if @article.save(context: :publicize)
        flash[:notice] = "記事を公開しました。"
        redirect_to articles_path
      else
        flash.now[:alert] = "記事を公開できませんでした。"
        render :new
      end
    else
      @article.is_active = false
      if @article.save
        flash[:notice] = "記事を下書き保存しました。"
        redirect_to user_path(current_user.id)
      else
        flash.now[:alert] = "記事を下書き保存できませんでした。"
        render :new
      end
    end
  end

  def index
    #@articles = Article.all.order(id: :desc)
    @articles = Article.where(is_active: true).order(id: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    article = Article.find(params[:id])
    
    if params[:publicize_draft]
      article.is_active = true
      if article.update(article_params)
        flash[:notice] = "記事を公開しました。"
        redirect_to articles_path
      else
        article.is_active = false
        render :edit, alert: "記事を公開できませんでした。"
      end
    elsif params[:update_article]
      article.is_active = true
      if article.update(article_params)
        flash[:notice] = "記事を更新しました。"
        redirect_to articles_path
      else
        render :edit, alert: "記事を更新できませんでした。"
      end
    else
      article.is_active = false
      if article.update(article_params)
        flash[:notice] = "下書き記事を更新しました。"
        redirect_to user_path(current_user.id)
      else
        render :edit, alert: "下書き記事を更新できませんでした。"
      end
    end
  end
  
  def destroy
    article = Article.find(params[:id])  
    article.destroy 
    if request.referer&.include?('/users/')
      redirect_to user_path(current_user.id)
    elsif request.referer&.include?('/articles')
      redirect_to articles_path  
    else
      redirect_to root_path
    end
  end
  
  
  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
