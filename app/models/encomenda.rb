class Encomenda < ApplicationRecord
  belongs_to :cliente

  validates :descricao, presence: true
  validates :data_prevista, presence: true
  validates :status, inclusion: { in: %w[Aguardando Enviado Entregue] }
end
