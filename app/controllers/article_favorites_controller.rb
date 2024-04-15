class ArticleFavoritesController < ApplicationController
    
  def create
    @article = Article.find(params[:article_id])
    article_favorite = current_user.article_favorites.new(article_id: @article.id)
    article_favorite.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    article_favorite = current_user.article_favorites.find_by(article_id: @article.id)
    article_favorite.destroy
  end
  
end
