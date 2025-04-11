json.extract! produto, :id, :nome, :preco, :codigo_barra, :created_at, :updated_at
json.url produto_url(produto, format: :json)
