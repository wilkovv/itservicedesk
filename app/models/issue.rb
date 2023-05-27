class Issue < ApplicationRecord
  belongs_to :serviceman
  belongs_to :user
  has_one_attached :photo
  validates :title, presence: true
  validates :description, presence: true
end
