# -*- coding: UTF-8 -*

require 'spec_helper'
require 'factory_girl'
 #:email, :graduacao, :nascimento, :nome
describe Professor do

  it "Quando um professor é cadastrado deve ser criado um usuário vinculado a ele" do
    professor =   FactoryGirl.build(:professor)
    professor.user.should be_true;
  end

end
