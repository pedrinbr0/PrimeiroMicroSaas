class Encomenda < ApplicationRecord
  has_many :encomenda_produtos, inverse_of: :encomenda, dependent: :destroy
  has_many :produtos, through: :encomenda_produtos

  belongs_to :cliente

  validates :descricao, presence: true
  validates :data_prevista, presence: true
  validates :status, inclusion: { in: %w[Aguardando Enviado Entregue] }

  belongs_to :cliente

  scope :com_nome_cliente, ->(termo) {
    joins(:cliente).where("LOWER(clientes.nome) LIKE ?", "%#{termo.downcase}%")
  }

  accepts_nested_attributes_for :encomenda_produtos, allow_destroy: true
end
