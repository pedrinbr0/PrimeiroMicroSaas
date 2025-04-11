class Produto < ApplicationRecord
  validates :nome, presence: true
  validates :preco, presence: true, numericality: { greater_than: 0 }
  validates :codigo_barra, presence: true, uniqueness: true
end
