json.extract! compra, :id, :cliente_id, :data, :descricao, :valor, :created_at, :updated_at
json.url compra_url(compra, format: :json)
