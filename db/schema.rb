# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_04_02_172822) do
  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.text "endereco"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compras", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.date "data"
    t.text "descricao"
    t.decimal "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_compras_on_cliente_id"
  end

  create_table "dividas", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.decimal "valor"
    t.date "data_vencimento"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_dividas_on_cliente_id"
  end

  create_table "encomendas", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.text "descricao"
    t.date "data_prevista"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_encomendas_on_cliente_id"
  end

  add_foreign_key "compras", "clientes"
  add_foreign_key "dividas", "clientes"
  add_foreign_key "encomendas", "clientes"
end
