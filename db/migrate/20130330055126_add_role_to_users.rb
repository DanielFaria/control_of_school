class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
  end
  add_index(:professores, :user_id)
end
