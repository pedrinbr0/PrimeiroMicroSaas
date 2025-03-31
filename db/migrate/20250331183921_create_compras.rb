class CreateCompras < ActiveRecord::Migration[7.1]
  def change
    create_table :compras do |t|
      t.references :cliente, null: false, foreign_key: true
      t.date :data
      t.text :descricao
      t.decimal :valor

      t.timestamps
    end
  end
end
