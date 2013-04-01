# -*- coding: UTF-8 -*
require 'spec_helper'
require 'factory_girl'

describe User do

  # Is there a scaffold for tests?
  it "Usuario deve gerar senhas aleatórias de acordo com tamanho passado"  do
    for i in 10..20
      senha = User.cria_password(i)
      senha.should be_true
      senha.size.should be i
    end
  end

  it "O usuário gerado para professor deve ter a role professor" do
       professor = FactoryGirl.build(:professor)
       usuario = User.cria_usuario_do(professor)
       usuario.e_professor?.should be_true
  end

  it "O usuário gerado para aluno deve ter a role aluno" do
    aluno =   FactoryGirl.build(:aluno)
    usuario = User.cria_usuario_do(aluno)
    usuario.e_aluno?.should be_true
  end
end
