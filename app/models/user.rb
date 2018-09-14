class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :name, presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 }
    has_secure_password
    has_many :tuita
    has_many :favorites, dependent: :destroy
    has_many :favorite_tuita, through: :favorites, source: :tuitum
end
