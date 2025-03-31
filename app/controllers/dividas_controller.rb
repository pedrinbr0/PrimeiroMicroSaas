class DividasController < ApplicationController
  before_action :set_divida, only: %i[show edit update destroy]

  def index
    @dividas = Divida.all
  end

  def show
  end

  def new
    @divida = Divida.new
  end

  def create
    @divida = Divida.new(divida_params)

    if @divida.save
      redirect_to @divida, notice: 'Dívida registrada com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @divida.update(divida_params)
      redirect_to @divida, notice: 'Dívida atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @divida.destroy
    redirect_to dividas_url, notice: 'Dívida excluída com sucesso.'
  end

  private

  def set_divida
    @divida = Divida.find(params[:id])
  end

  def divida_params
    params.require(:divida).permit(:cliente_id, :valor, :data_vencimento, :status)
  end
end
