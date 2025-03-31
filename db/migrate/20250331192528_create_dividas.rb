class CreateDividas < ActiveRecord::Migration[7.1]
  def change
    create_table :dividas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.decimal :valor
      t.date :data_vencimento
      t.string :status

      t.timestamps
    end
  end
end
