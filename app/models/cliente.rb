class Cliente < ApplicationRecord
  has_many :contrato
  has_many :servico, through: :contrato

  validates :nome_completo, presence: {message: 'Nome completo obrigatório'}, format: {with: /\A[a-zA-Z]/}, length: {minimum: 8, maximum: 80}
  validates :data_de_nascimento, presence: {message: 'Data de nascimento obrigatória'}
  validates :cpf, presence: {message: 'CPF obrigatório'}, length: {minimum: 11, maximum: 11}, numericality: {only_integer: true}, uniqueness: true
  validates :email, presence: {message: 'E-mail obrigatório'}, format: {with: URI:: MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :telefone, presence: {message: 'Telefone para contato obrigatório'}, length: {is: 11, message: 'Precisa ter 11 dígitos'}
  validates :logradouro, presence: true, length: {maximum: 40}
  validates :complemento, presence: true, length: {maximum: 40}
  validates :bairro, presence: true, length: {maximum: 40}, format: { with: /\A[a-zA-Z]+\z/}
  validates :cidade, presence: true, length: {maximum: 40}, format: { with: /\A[a-zA-Z]+\z/}
  validates :cep, presence: true, length: {minimum:8, maximum: 8}, numericality: {only_integer: true}
  validates :senha, presence: {message: 'Senha obrigatória'}, length: {minumum: 5, maximum: 20}, uniqueness: true
  validate :valida_data

  def valida_data
    if data_de_nascimento.present? && data_de_nascimento > Date.today
      errors.add(:data_de_nascimento, "A data deve ser a de hoje ou anterior")
    end
  end
end
