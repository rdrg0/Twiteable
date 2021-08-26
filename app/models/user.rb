class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  enum role: { member: 0, admin: 1 }

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar
end
