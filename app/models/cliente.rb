class Cliente < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
  has_many :contratos
  has_many :servicos, through: :contratos

  validates :nome_completo, presence: {message: 'Nome completo obrigatório'}, format: {with: /\A[a-zA-Z]/}, length: {minimum: 8, maximum: 80}
  validates :data_de_nascimento, presence: {message: 'Data de nascimento obrigatória'}
  validates_format_of :email, presence: {message: 'E-mail obrigatório'}, format: {with: URI:: MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :telefone, presence: {message: 'Telefone obrigatório'}, length: {is: 11, message: 'Precisa ter 11 dígitos'}
  validates :cpf, presence: {message: 'CPF obrigatório'}, length: {minimum: 11, maximum: 11}, numericality: {only_integer: true}, uniqueness: true
  validates :senha, presence: {message: 'Senha obrigatória'}, length: {minumum: 5, maximum: 10}, uniqueness: {:case_sensitive => true}
  validate :valida_data

  def valida_data
    if data_de_nascimento.present? && data_de_nascimento > Date.today
      errors.add(:data_de_nascimento, "A data deve ser a de hoje ou anterior")
    end
  end
end
