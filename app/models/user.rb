class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  # 空白NG
  validates :name, presence: true
  validates :email, presence: true

  # 一意性
  validates :name, uniqueness: true
  validates :email, uniqueness: true


  # 画像のattach
  attachment :profile_bg
  attachment :profile_image
  


def self.guest
  find_or_create_by(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
  end
end
end