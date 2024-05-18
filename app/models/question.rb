class Question < ApplicationRecord
  
  belongs_to :user
  has_many :question_comments, dependent: :destroy
  has_many :question_answers, dependent: :destroy
  
  with_options presence: true, on: :publicize do
    validates :title
    validates :body
  end

  
  validates :title, length: { maximum: 30 }
  validates :body, length: { maximum: 1000 }
  
#   def favorited_by?(user)
#   favorites.where(user_id: user.id).exists?
#   end

  def self.looks(search, keyword)
    @question = Question.where("title LIKE?","%#{keyword}%")
  end

end