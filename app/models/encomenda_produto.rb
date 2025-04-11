class EncomendaProduto < ApplicationRecord
  belongs_to :encomenda
  belongs_to :produto

  validates :quantidade, numericality: { only_integer: true, greater_than: 0 }
end
