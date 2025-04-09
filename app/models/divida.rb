class Divida < ApplicationRecord
  belongs_to :cliente

  def status_pagamento
    return "Pago" if status == "Pago"

    if data_vencimento < Date.today
      "Atrasado"
    elsif data_vencimento <= Date.today + 3
      "Vence em breve"
    else
      "Pendente"
    end
  end

  scope :busca_por_cliente, ->(termo) {
  joins(:cliente).where("LOWER(clientes.nome) LIKE ?", "%#{termo.downcase}%") if termo.present?
}


end
