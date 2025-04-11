class CreateProdutos < ActiveRecord::Migration[7.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.decimal :preco
      t.string :codigo_barra

      t.timestamps
    end
    add_index :produtos, :codigo_barra, unique: true
  end
end
