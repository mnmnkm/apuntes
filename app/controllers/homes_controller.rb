class HomesController < ApplicationController
  def top
    @articles = Article.all.order(id: :desc)
    @words = Word.all.order(id: :desc)
    @questions = Question.all.order(id: :desc)
  end
end
