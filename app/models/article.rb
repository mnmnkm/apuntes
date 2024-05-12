class Article < ApplicationRecord

  belongs_to :user
  has_many :article_comments, dependent: :destroy
  has_many :article_favorites, dependent: :destroy
  has_rich_text :body
  
  with_options presence: true do
    validates :title
    validates :body
  end
  
  validates :title, length: { maximum: 30 }
  # validates :body, length: { maximum: 1000 }, on: :publicize 
  
  # validates :title, presence: true
  # validates :body, presence: true
  
  # def favorited_by?(user)
  # favorites.where(user_id: user.id).exists?
  # end
  
  def favorited_by?(user)
    article_favorites.exists?(user_id: user.id)
  end
  
  # def self.search_for(keyword)
  def self.looks(keyword)
      Article.where('title LIKE ?', "%#{keyword}%")
  end

end