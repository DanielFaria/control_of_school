# -*- coding: UTF-8 -*

class Professor < ActiveRecord::Base
  attr_accessible :email, :graduacao,:nascimento, :nome
  attr_readonly :user
  has_one :user, :as => :usuario

  #VALIDADTIONS
  validates_presence_of :nome, message: "Nome deve ser preenchido"
  validates_presence_of :graduacao, message: "Professor deve ter uma gradução"
  validates_uniqueness_of :email, message: "O email dever ser único"



  def initialize(attributes= nil )
    super(attributes)
    self.send("#{:user}=",User.cria_usuario_para(self))
  end
end

