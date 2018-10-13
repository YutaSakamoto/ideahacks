class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :topics, foreign_key: "user_id", dependent: :destroy
  has_many :favorites, foreign_key: "user_id", dependent: :destroy
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :reviews, foreign_key: "user_id", dependent: :destroy

  has_many :collections
  has_many :declears

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship"
  has_many :followers, through: :follower_relationships

  has_many :notifications, dependent: :destroy

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def self.from_omniauth(auth)
  user = User.where(email: auth.info.email).first

  if user
    return user
  else
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.fullname = auth.info.name
      user.image = auth.info.image
      user.uid = auth.uid
      user.provider = auth.provider

      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end
end

end
