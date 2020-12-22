class Zine < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :year, :month, presence: true
end
