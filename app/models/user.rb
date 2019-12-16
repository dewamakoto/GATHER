class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :contacts
  has_many :notifications
  has_many :favorites, dependent: :destroy
  has_many :favorited_bars, through: :favorites, source: :bar
  has_many :comments,dependent: :destroy
  has_many :comunities,through: :user_comunities
  has_many :posts,dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  attachment :image

  def friends
    followings & followers
  end


  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
