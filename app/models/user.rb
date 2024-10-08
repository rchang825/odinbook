class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :idol_follows, foreign_key: :follower_id, class_name: 'Follow'
  has_many :idols, through: :idol_follows, class_name: 'User'
  has_many :fan_follows, foreign_key: :followee_id, class_name: 'Follow'
  has_many :fans, through: :fan_follows, class_name: 'User'

protected
  def confirmation_required?
    false
  end
end
