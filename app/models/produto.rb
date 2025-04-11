class Produto < ApplicationRecord
  has_many :encomenda_produtos, dependent: :destroy
  has_many :encomendas, through: :encomenda_produtos

  validates :nome, presence: true
  validates :preco, presence: true, numericality: { greater_than: 0 }
  validates :codigo_barra, presence: true, uniqueness: true
end
