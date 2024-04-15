class WordFavoritesController < ApplicationController
    
  def create
    @word = Word.find(params[:word_id])
    word_favorite = current_user.word_favorites.new(word_id: @word.id)
    word_favorite.save
  end

  def destroy
    @word = Word.find(params[:word_id])
    word_favorite = current_user.word_favorites.find_by(word_id: @word.id)
    word_favorite.destroy
  end
  
end
