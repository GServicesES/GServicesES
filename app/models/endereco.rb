class Endereco < ApplicationRecord
  belongs_to :administrador
  belongs_to :cliente
  belongs_to :trabalhador

  validates :cep, presence: true, length: {minimum:8, maximum: 8}, numericality: {only_integer: true}
  validates :bairro, presence: true, length: {maximum: 40}, format: { with: /\A[a-zA-Z]+\z/}
  validates :cidade, presence: true, length: {maximum: 40}, format: { with: /\A[a-zA-Z]+\z/}
  validates :logradouro, presence: true, length: {minimum:6, maximum: 40}
  validates :complemento, presence: true, length: {minimum:6, maximum: 40}
end
