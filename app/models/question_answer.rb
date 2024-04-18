class QuestionAnswer < ApplicationRecord

  belongs_to :user
  belongs_to :question
  has_many :answer_favorites, dependent: :destroy
  
  def favorited_by?(user)
    pp self
    answer_favorites.exists?(user_id: user.id)
  end

end
