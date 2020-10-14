class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: PASSWORD_REGEX }
  validates :nickname, presence: true
  JAPANESE_REGEX = /\A[あ-んア-ン一-龥]+\z/i
  validates :family_name, presence: true, format: { with: JAPANESE_REGEX }
  validates :first_name, presence: true, format: { with: JAPANESE_REGEX }
  KATAKANA_REGEX = /\A[ア-ン]+\z/i
  validates :family_name_reading, presence: true, format: { with: KATAKANA_REGEX }
  validates :first_name_reading, presence: true, format: { with: KATAKANA_REGEX }
  validates :birthday, presence: true
end
