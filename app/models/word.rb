class Word < ApplicationRecord
    
  belongs_to :user
  has_many :word_comments, dependent: :destroy
  has_many :word_favorites, dependent: :destroy
  
  with_options presence: true, on: :publicize do
    validates :spanish
    validates :japanese
    validates :spanish_example
    validates :japanese_example
  end
    
  validates :spanish, length: { maximum: 20 }, on: :publicize
  validates :japanese, length: { maximum: 20 }, on: :publicize
  validates :spanish_example, length: { maximum: 200 }, on: :publicize
  validates :japanese_example, length: { maximum: 200 }, on: :publicize
  
#   def favorited_by?(user)
#   favorites.where(user_id: user.id).exists?
#   end

  def favorited_by?(user)
    word_favorites.exists?(user_id: user.id)
  end
  
  def self.search(search)
    if search != ""
      Word.where(['spanish LIKE(?) OR japanese LIKE(?) OR spanish_example LIKE(?) OR japanese_example LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Word.includes(:user).order('created_at DESC')
    end
  end

end