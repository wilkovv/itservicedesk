class Issue < ApplicationRecord
  belongs_to :serviceman
  belongs_to :user
  has_one_attached :photo
  validates :title, presence: true
  validates :description, presence: true
  #validates :category, presence: true, inclusion: { in: ['Hardware', 'Software'], message: 'must be either "Hardware" or "Software"' }
end
