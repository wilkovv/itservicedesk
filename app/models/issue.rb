class Issue < ApplicationRecord
  belongs_to :servicemen
  belongs_to :users
end
