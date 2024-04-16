class AnswerFavorite < ApplicationRecord
    
  belongs_to :user
  belongs_to :question_answer
  
  validates :user_id, uniqueness: {scope: :answer_id}
  
end
