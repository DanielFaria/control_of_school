require 'spec_helper'

describe Users do

  # Is there one scaffold for tests?
  it "Usuario deve gerar senhas aleatórias de acordo com tamanho passado"  do
    senha = User.cria_password(8)
    senha.should be_true
    senha.lenght.should be 8
  end






end
