class ArticleCommentsController < ApplicationController
    
  def create
    article = Article.find(params[:article_id])
    comment = current_user.article_comments.new(article_comment_params)
    comment.article_id = article.id
    comment.save
    redirect_to article_path(params[:article_id])
  end
  
  def destroy
    ArticleComment.find(params[:id]).destroy
    redirect_to article_path(params[:article_id])
  end

  private

  def article_comment_params
    params.require(:article_comment).permit(:comment)
  end
    
end
