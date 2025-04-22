class AddValorTotalToEncomendas < ActiveRecord::Migration[7.1]
  def change
    add_column :encomendas, :valor_total, :decimal
  end
end
