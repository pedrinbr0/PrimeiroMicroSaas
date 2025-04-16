class EncomendaProduto < ApplicationRecord
  belongs_to :encomenda
  belongs_to :produto

  validates :quantidade, numericality: { greater_than: 0 }
end
