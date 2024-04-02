class Word < ApplicationRecord
    
  belongs_to :user
  has_many :word_comments, dependent: :destroy
#   has_many :favorites, dependent: :destroy
    
  validates :spanish, presence: true
  validates :japanese, presence: true
  validates :spanish_example, presence: true
  validates :japanese_example, presence: true
  
#   def favorited_by?(user)
#   favorites.where(user_id: user.id).exists?
#   end

end