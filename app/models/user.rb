# -*- coding: UTF-8 -*

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :usuario,   :polymorphic => true
  ROLES = %w[Aluno Administador Professor]



  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:role, :update_at
  # attr_accessible :title, :body

  #def initialize(attributes= nil )
   # if (attributes)
    #  attributes.store(:update_at,Time.now)
    #end
    #super(attributes)
  #end


  def e_professor?
    return role.eql? "Professor"
  end

  def e_aluno?
    return role.eql? "Aluno"
  end

  #Before this method was called criaUsuarioPara
  # It's me thinking as java' programmer
  #def self.criaUsuarioPara(funcao)
  def self.cria_usuario_para(funcao)
    #Cuidando com is or Kind porque retornam true para superclasse
    #http://stackoverflow.com/questions/3893278/ruby-kind-of-vs-instance-of-vs-is-a
    if funcao.instance_of? Professor or funcao.instance_of? Aluno
      return cria_usuario_do(funcao)
    else
      raise TypeError, 'Só pode ser criado usuário para Professores ou alunos'
    end
  end

  #Credits to http://stackoverflow.com/questions/5966910/generate-unique-random-string-with-letters-and-numbers-in-lower-case
  #It's so easy add arrays.Don't look like real
  def self.cria_password(tamanho)
    array = (?0..?9).to_a + (?a..?z).to_a
    password = tamanho.times.inject("") {|s, i| s << array[rand(array.size)]}
    return password
  end

  private
  def self.cria_usuario_do(funcao)
    role = cria_role_para(funcao)
    password = cria_password(8)
    return User.new :email => funcao.email,
                    :role => cria_role_para(funcao),
                    :password => password,
                    :password_confirmation => password
  end



  private
  def self.cria_role_para(funcao)
    if funcao.instance_of? Professor
        return "Professor"
    else
       return  "Aluno"
    end
  end

end