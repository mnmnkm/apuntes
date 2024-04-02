class Question < ApplicationRecord
    
　belongs_to :user
　has_many :question_comments, dependent: :destroy
  has_many :question_answers, dependent: :destroy
    
　validates :title, presence: true
  validates :body, presence: true
  
#   def favorited_by?(user)
#   favorites.where(user_id: user.id).exists?
#   end

end