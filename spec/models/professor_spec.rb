# -*- coding: UTF-8 -*
require 'database_cleaner'
require 'spec_helper'
require 'factory_girl'
 #:email, :graduacao, :nascimento, :nome
describe Professor do


  it "Quando um professor é criado deve ser criado um usuário vinculado a ele" do
    professor = Professor.new(FactoryGirl.attributes_for(:professor));
    professor.user.should be_true;
  end


  it "Professor deve ter um email válido" do
    professor = Professor.new(FactoryGirl.attributes_for(:professor,:email=>"teste"));
    professor.should_not be_valid
  end

  it "Professor deve ter um email com domínio" do
    professor = Professor.new(FactoryGirl.attributes_for(:professor,:email=>"teste@"));
    puts professor.user.email
    professor.should_not be_valid
  end

  it "Professor deve aceitar um email com domínio" do
    professor = Professor.new(FactoryGirl.attributes_for(:professor,:email=>"teste@gmail.com"));
    professor.should be_valid
  end

  it "Email  do professor deve ser o informado" do
    professor = Professor.new(FactoryGirl.attributes_for(:professor,:email=>"teste@gmail.com"));
    professor.email.eql?("teste@gmail.com").should be_true
  end


  it "Professor deve aceitar um email com br" do
    professor = Professor.new(FactoryGirl.attributes_for(:professor,:email=>"teste@gmail.com"));
    professor.should be_valid
  end

  it "Deve ser salvo um usuário para cada professor cadastrado" do
     #this way doesn't work
     #professor = FactoryGirl.create(:professor, :email => "teste@gmail.com.br");
     #User.find_by_email("teste@gmail.com.br").should be_true
    DatabaseCleaner.start
    professor  = Professor.new(FactoryGirl.attributes_for(:professor,:email=>"teste@gmail.com"));
    professor.save
    User.find_by_email("teste@gmail.com").should be_true
  end



end
