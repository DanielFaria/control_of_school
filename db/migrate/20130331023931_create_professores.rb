class CreateProfessores < ActiveRecord::Migration
  def change
    create_table :professores do |t|
      t.string :nome
      t.datetime :nascimento
      t.string :graduacao
      t.string :email

      t.timestamps
    end
  end
end
