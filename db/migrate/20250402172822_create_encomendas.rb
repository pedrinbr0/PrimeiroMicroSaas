class CreateEncomendas < ActiveRecord::Migration[7.1]
  def change
    create_table :encomendas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.text :descricao
      t.date :data_prevista
      t.string :status

      t.timestamps
    end
  end
end
