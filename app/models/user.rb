class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  # バリデーション追記
  validates :name, presence: true, length: {minimum: 2, maximum: 20 }
  validates :title, presence: true
  validates :body, presence: true

  attachment :image
end
