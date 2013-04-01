# -*- coding: UTF-8 -*

require 'spec_helper'
 #:email, :graduacao, :nascimento, :nome
describe Professor do

  it "Quando um professor é cadastrado deve ser criado um usuário vinculado a ele" do

    professor = Professor.new :email =>"teste@gmail.com",
                              :graduacao => "História",
                              :nome =>"Paulo Dias Alencar",
                              :nascimento => Time.now
    professor.user.should be_true;
  end

end
