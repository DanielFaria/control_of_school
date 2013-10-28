# -*- coding: UTF-8 -*

class Professor < ActiveRecord::Base
  attr_accessible :graduacao,:nascimento, :nome, :email
  attr_readonly   :user
  attr_accessor   :email
  has_one :user, :as => :usuario, :foreign_key => "id",:autosave => true
  #VALIDADTIONS
  validates_presence_of :nome, message: "Nome deve ser preenchido"
  validates_presence_of :graduacao, message: "Professor deve ter uma gradução"
  #validates_uniqueness_of :email, message: "O email dever ser único"
  #validate :email_is_valid




  def initialize(attributes= nil )
  #this looks like bad practice
  #Someone have idea to how make it more better...
    email = nil;
    if(attributes)
      email = attributes[:email];
      attributes.delete(:email)
    end
    super(attributes)
    self.email = email
    self.send("#{:user}=",User.cria_usuario_para(self))
  end

  def email
    if(read_attribute(:user))
        return self.user.email
     else
        return "testess@gmail.com"   
     end   
  end  



end