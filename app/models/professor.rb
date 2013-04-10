# -*- coding: UTF-8 -*

class Professor < ActiveRecord::Base
  attr_accessible :graduacao,:nascimento, :nome
  attr_accessor   :email
  attr_readonly   :user
  has_one :user, :as => :usuario, :foreign_key => "user_id",:autosave => true
  #VALIDADTIONS
  validates_presence_of :nome, message: "Nome deve ser preenchido"
  validates_presence_of :graduacao, message: "Professor deve ter uma gradução"
  validates_uniqueness_of :email, message: "O email dever ser único"
  validate :email_is_valid




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

  private
  def email_is_valid
    errors.add(:email,
               "email #{self.email} invalido") unless
                 email =~ /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i

  end




end

