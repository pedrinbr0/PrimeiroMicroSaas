class Cliente < ApplicationRecord
  has_many :compras, dependent: :destroy

  scope :busca_nome, ->(termo) {
  where("LOWER(nome) LIKE ?", "%#{termo.downcase}%") if termo.present?
}

end
