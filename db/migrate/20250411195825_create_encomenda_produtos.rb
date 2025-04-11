class CreateEncomendaProdutos < ActiveRecord::Migration[7.1]
  def change
    create_table :encomenda_produtos do |t|
      t.references :encomenda, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
