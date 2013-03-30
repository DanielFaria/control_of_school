class CreateAboboras < ActiveRecord::Migration
  def change
    create_table :aboboras do |t|
      t.string :nome

      t.timestamps
    end
  end
end
