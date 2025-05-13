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

ActiveRecord::Schema[7.1].define(version: 2025_04_22_202817) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.text "endereco"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compras", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.date "data"
    t.text "descricao"
    t.decimal "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_compras_on_cliente_id"
  end

  create_table "dividas", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.decimal "valor"
    t.date "data_vencimento"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_dividas_on_cliente_id"
  end

  create_table "encomenda_produtos", force: :cascade do |t|
    t.bigint "encomenda_id", null: false
    t.bigint "produto_id", null: false
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encomenda_id"], name: "index_encomenda_produtos_on_encomenda_id"
    t.index ["produto_id"], name: "index_encomenda_produtos_on_produto_id"
  end

  create_table "encomendas", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.text "descricao"
    t.date "data_prevista"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "valor_total"
    t.index ["cliente_id"], name: "index_encomendas_on_cliente_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.decimal "preco"
    t.string "codigo_barra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codigo_barra"], name: "index_produtos_on_codigo_barra", unique: true
  end

  add_foreign_key "compras", "clientes"
  add_foreign_key "dividas", "clientes"
  add_foreign_key "encomenda_produtos", "encomendas"
  add_foreign_key "encomenda_produtos", "produtos"
  add_foreign_key "encomendas", "clientes"
end
