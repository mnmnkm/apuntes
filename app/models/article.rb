class Article < ApplicationRecord

  belongs_to :user
  has_many :article_comments, dependent: :destroy
  has_many :article_favorites, dependent: :destroy
  has_rich_text :body
  
  with_options presence: true, on: :publicize do
    validates :title
    validates :body
  end
  
  validates :title, length: { maximum: 20 }, on: :publicize
  validates :body, length: { maximum: 500 }, on: :publicize
  
  # validates :title, presence: true
  # validates :body, presence: true
  
  # def favorited_by?(user)
  # favorites.where(user_id: user.id).exists?
  # end
  
  def favorited_by?(user)
    article_favorites.exists?(user_id: user.id)
  end

end