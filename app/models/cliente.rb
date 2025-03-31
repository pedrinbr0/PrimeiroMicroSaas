class Cliente < ApplicationRecord
  has_many :compras, dependent: :destroy
end
