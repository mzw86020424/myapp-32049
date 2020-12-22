class User < ApplicationRecord
  has_many :posts
  has_many :zines
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
  validates :email, :image
  validates :nickname, length: { maximum: 6 }
  end
end
