class CreateVeiculos < ActiveRecord::Migration
  def change
    create_table :veiculos do |t|
      t.string :marca
      t.string :modelo
      t.string :ano
      t.string :placa
      t.string :cidade
      t.string :uf
      t.string :cri
      t.string :observacoes

      t.timestamps null: false
    end
  end
end
