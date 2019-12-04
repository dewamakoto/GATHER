class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :contacts
  has_many :notifications
  has_many :favorites, dependent: :destroy
  has_many :favorited_bars, through: :favorites, source: :bar
  has_many :comments
  has_many :comunities,through: :user_comunities
  has_many :posts


  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
