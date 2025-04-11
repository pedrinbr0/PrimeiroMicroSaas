class EncomendaProduto < ApplicationRecord
  belongs_to :encomenda
  belongs_to :produto
end
