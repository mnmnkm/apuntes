class Article < ApplicationRecord

  belongs_to :user
  has_many :article_comments, dependent: :destroy
  has_many :article_favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  
  # def favorited_by?(user)
  # favorites.where(user_id: user.id).exists?
  # end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
