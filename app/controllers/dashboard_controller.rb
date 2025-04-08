class DashboardController < ApplicationController
  def index
    @dividas_vencidas = Divida.where("status = ? AND data_vencimento < ?", "pendente", Date.today)
    @dividas_proximas = Divida.where("status = ? AND data_vencimento BETWEEN ? AND ?", "pendente", Date.today, Date.today + 3)
    @encomendas_atrasadas = Encomenda.where("status != ? AND data_prevista < ?", "Entregue", Date.today)
    @ultimas_compras = Compra.order(created_at: :desc).limit(5)
  end
end
