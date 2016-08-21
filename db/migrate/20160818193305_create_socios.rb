class CreateSocios < ActiveRecord::Migration
  def change
    create_table :socios do |t|
      t.string :nome
      t.string :cpf
      t.date :dataNascimento
      t.string :administrador

      t.timestamps null: false
    end
  end
end
