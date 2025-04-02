class RelatoriosController < ApplicationController
  def index
    @periodo = params[:periodo]
    @data_inicio = params[:data_inicio].presence || (Date.today - @periodo.to_i)
    @data_fim = params[:data_fim].presence || Date.today

    @dividas = Divida.where(data_vencimento: @data_inicio..@data_fim)
  end
end
