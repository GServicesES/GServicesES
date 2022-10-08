require "test_helper"

class AdministradorTest < ActiveSupport::TestCase

  def setup
    @administrador = Administrador.new(nome_completo: 'Luiz Felipe Ferr',
                                       data_de_nascimento: Time.zone.today,
                                       email: 'luizfelipeghg.ssu@gmail.com',
                                       telefone:'40028922222',
                                       senha:'123456789')
  end
  test 'Salvando administrador com dados validos' do
    assert @administrador.valid?

  end

  test 'Criando cadastro de administrador sem nome' do
    @administrador.nome_completo = ' '
    assert_not @administrador.valid?
  end

  test 'Criando cadastro de administrador com senha existente' do
    @administrador.senha = '123456788'
    assert_not @administrador.valid?
  end

end
