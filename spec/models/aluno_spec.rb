# -*- coding: UTF-8 -*
require 'spec_helper'

describe Aluno do
  it "Quando um aluno é cadastrado deve ser criado um usuário vinculado a ele" do
    aluno = FactoryGirl.build(:aluno)
    aluno.user.should be_true;
  end
end
