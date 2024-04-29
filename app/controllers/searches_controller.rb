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
      
      if @range == "user"
        @users = User.looks(params[:search], params[:keyword])
      elsif @model == "article"
        @articles = Article.looks(params[:keyword])
      elsif @model == "word"
        #byebug
        # @words = Word.looks(params[:search], params[:keyword])
        @words = Word.looks(params[:keyword])
        @word_comment = WordComment.new
      else 
        @questions = Question.looks(params[:search], params[:keyword])
        @is_active_questions = @questions.where(is_active: true).order(id: :desc)
        @not_active_questions = @questions.where(is_active: false).order(id: :desc)
      end
    end
  
end
