require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  validates :username, presence: true, uniqueness: true

  enum role: { member: 0, admin: 1 }

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  has_many :authentications, dependent: :destroy
  has_one_attached :avatar

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def self.from_omniauth(auth)
    authentication = Authentication.find_or_initialize_by(provider: auth.provider, uid: auth.uid)

    unless authentication.persisted?
      @user = find_or_create_by(email: auth.info.email) do |new_user|
        new_user.name = auth.info.name
        new_user.username = auth.info.nickname
        new_user.avatar.attach(io: File.open('app/assets/images/Imageanonymus.png'),
                               filename: 'Imageanonymus.png')
        new_user.password = '123456' # Devise.friendly_token[0, 20]
      end
      authentication.user = @user
      authentication.save if @user.persisted?
    end
    authentication.user
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  has_one_attached :avatar
end
