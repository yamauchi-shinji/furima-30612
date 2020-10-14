class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :nickname
    validates :family_name, format: { with: /\A[あ-んア-ン一-龥]+\z/i }
    validates :first_name, format: { with: /\A[あ-んア-ン一-龥]+\z/i } 
    validates :family_name_reading, format: { with: /\A[ア-ン]+\z/i }
    validates :first_name_reading, format: { with: /\A[ア-ン]+\z/i}
    validates :birthday
  end
end
