# -*- coding: UTF-8 -*

class Professor < ActiveRecord::Base
  attr_accessible :email, :graduacao, :nascimento, :nome
  attr_readonly :user
  has_one :user, :as => :usuario

  def initialize(attributes= nil )
    super(attributes)
    self.send("#{:user}=",User.cria_usuario_do(self))
  end



end
