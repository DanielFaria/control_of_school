class AddUserIdToTeacher < ActiveRecord::Migration
  def change
    add_index(:professores, :user_id)
  end
end
