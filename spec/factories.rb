# -*- coding: UTF-8 -*

require 'factory_girl'

FactoryGirl.define do

  factory :professor do
      email  "teste@gmail.com"
      graduacao  "História"
      nome  "Paulo Dias Alencar"
      nascimento {27.years.ago}
  end

  factory :aluno do
    email  "teste@gmail.com"
    nome  "Paulo Dias Alencar"
    nascimento {14.years.ago}
  end

end