class User < ApplicationRecord
    has_many :issues
    has_many :servicemen, through: :issues
end
