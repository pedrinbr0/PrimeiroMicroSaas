class Encomenda < ApplicationRecord
  belongs_to :cliente

  validates :descricao, presence: true
  validates :data_prevista, presence: true
  validates :status, inclusion: { in: %w[Aguardando Enviado Entregue] }

  belongs_to :cliente

  scope :com_nome_cliente, ->(termo) {
    joins(:cliente).where("LOWER(clientes.nome) LIKE ?", "%#{termo.downcase}%")
  }

end
