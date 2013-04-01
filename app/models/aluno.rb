class Aluno < ActiveRecord::Base
  attr_accessible :email, :nascimento, :nome
end
