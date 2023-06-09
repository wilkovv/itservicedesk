class Serviceman < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
    has_many :issues
    has_many :users, through: :issues
    validates :category, presence: true, inclusion: { in: ['Hardware', 'Software'], message: 'must be either "Hardware" or "Software"' }
end
