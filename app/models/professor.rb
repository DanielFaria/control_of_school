# -*- coding: UTF-8 -*

class Professor < ActiveRecord::Base
  attr_accessible :email, :graduacao, :nascimento, :nome, :user
  attr_readonly :user
  has_one :user, :as => :usuario





  def after_initialize
    puts "Criando usuário"
  end



end
