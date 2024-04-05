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
  
         
  has_one_attached :profile_image
  
  def get_profile_image(x,y)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end
end
