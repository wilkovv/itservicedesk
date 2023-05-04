class Issue < ApplicationRecord
  belongs_to :serviceman
  belongs_to :user
end
