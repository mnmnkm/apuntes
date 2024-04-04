class WordFavoritesController < ApplicationController
    
  def create
    word = Word.find(params[:word_id])
    word_favorite = current_user.word_favorites.new(word_id: word.id)
    word_favorite.save
    redirect_to words_path
  end

  def destroy
    word = Word.find(params[:word_id])
    word_favorite = current_user.word_favorites.find_by(word_id: word.id)
    word_favorite.destroy
    redirect_to words_path
  end
  
end
