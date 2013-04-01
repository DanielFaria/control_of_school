class Aluno < ActiveRecord::Base
  attr_accessible :email, :nascimento, :nome
  attr_readonly :user
  has_one :user, :as => :usuario


  def initialize(attributes= nil )
    super(attributes)
    self.send("#{:user}=",User.cria_usuario_para(self))
  end


end
