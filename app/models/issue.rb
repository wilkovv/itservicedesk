class Issue < ApplicationRecord
    belongs_to :user
    belongs_to :serviceman
end
