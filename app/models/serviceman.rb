class Serviceman < ApplicationRecord
    has_many :issues
    has_many :users, through: :issues
end
