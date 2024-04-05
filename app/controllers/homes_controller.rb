class HomesController < ApplicationController
  def top
    @articles = Article.all
    @words = Word.all
    @questions = Question.all
  end
end
