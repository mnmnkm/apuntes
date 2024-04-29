class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :articles, dependent: :destroy
  has_many :article_comments, dependent: :destroy
  has_many :article_favorites, dependent: :destroy
  has_many :words, dependent: :destroy
  has_many :word_comments, dependent: :destroy
  has_many :word_favorites, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :question_comments, dependent: :destroy
  has_many :question_answers, dependent: :destroy
  has_many :answer_favorites, dependent: :destroy
  
         
  has_one_attached :profile_image
  
  def get_profile_image(x,y)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [x, y]).processed
  end
  
  # def self.search_for(keyword)
  def self.looks(search, keyword)
    # if method == 'perfect'
    #   User.where(name: content)
    # elsif method == 'forward'
    #   User.where('name LIKE ?', content + '%')
    # elsif method == 'backward'
    #   User.where('name LIKE ?', '%' + content)
    # else
      User.where('name LIKE ?', '%' + keyword + '%')
    # end
  end
  
  # フォローしている関連付け
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローされている関連付け
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォローしているユーザーを取得
  has_many :followings, through: :active_relationships, source: :followed
  # フォロワーを取得
  has_many :followers, through: :passive_relationships, source: :follower
  
  # 指定したユーザーをフォローする
  def follow(user)
    active_relationships.create(followed_id: user.id)
  end
  
  # 指定したユーザーのフォローを解除する
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
  
  # 指定したユーザーをフォローしているかどうかを判定
  def following?(user)
    followings.include?(user)
  end
  
  enum spanish_level: { Nativo: 0, Principiante: 1, Elemental: 2, Internedio: 3, Avanzado: 4, Excelente: 5 }

end
