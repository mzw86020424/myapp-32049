class Post < ApplicationRecord
  belongs_to :user
  belongs_to :zine

  with_options presence: true do
    validates :year, :month
    validates :url
  end
end
