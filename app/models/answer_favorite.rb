class AnswerFavorite < ApplicationRecord
    
  belongs_to :user
  belongs_to :question_answer
  
end
