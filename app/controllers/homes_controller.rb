class HomesController < ApplicationController
  def top
    # @articles = Article.all.order(id: :desc)
    @articles = Article.where(is_active: false).order(id: :desc)
    # @words = Word.all.order(id: :desc)
    @words = Word.where(is_active: false).order(id: :desc)
    @questions = Question.all.order(id: :desc)
  end
end
