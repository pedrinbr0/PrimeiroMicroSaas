json.extract! encomenda, :id, :cliente_id, :descricao, :data_prevista, :status, :created_at, :updated_at
json.url encomenda_url(encomenda, format: :json)
