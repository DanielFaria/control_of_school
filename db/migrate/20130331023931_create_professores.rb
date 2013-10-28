class CreateProfessores < ActiveRecord::Migration
  def change
    create_table :professores do |t|
      t.string :nome
      t.datetime :nascimento
      t.string :graduacao
      t.string  :usuario_type
      t.references :user, :polymorphic => true
      t.timestamps
    end
  end
end
