class Prefecture < ApplicationRecord
  has_many :birthplaces

  has_many :users, through: :birthplaces
end
