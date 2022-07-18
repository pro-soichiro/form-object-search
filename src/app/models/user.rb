class User < ApplicationRecord
  has_one :birthplace, dependent: :destroy
end
