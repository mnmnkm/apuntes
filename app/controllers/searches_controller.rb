class SearchesController < ApplicationController
    
    def search
      @model = params[:model]
      # @keyword = params[:keyword]
      # @method = params[:method]
      
      # 選択したモデルに応じて検索を実行
      # if @model  == "user"
      #   @records = User.search_for(@keyword)
      # elsif @model == "article"
      #   @records = Article.search_for(@keyword)
      # else
      #   @records = Word.search_for(@keyword)
      # end
      
      if @range == "User"
        @users = User.looks(params[:search], params[:keyword])
      elsif @model == "Article"
        @articles = Article.looks(params[:search], params[:keyword])
      elsif @model == "Word"
        # @words = Word.looks(params[:search], params[:keyword])
        @words = Word.search(params[:keyword])
      else 
        @questions = Question.looks(params[:search], params[:keyword])
      end
    end
  
end
