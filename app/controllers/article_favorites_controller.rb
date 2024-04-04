class ArticleFavoritesController < ApplicationController
    
  def create
    article = Article.find(params[:article_id])
    article_favorite = current_user.article_favorites.new(article_id: article.id)
    article_favorite.save
    redirect_to article_path(article)
  end

  def destroy
    article = Article.find(params[:article_id])
    article_favorite = current_user.article_favorites.find_by(article_id: article.id)
    article_favorite.destroy
    redirect_to article_path(article)
  end
  
end
