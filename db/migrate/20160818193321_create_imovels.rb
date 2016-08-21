class CreateImovels < ActiveRecord::Migration
  def change
    create_table :imovels do |t|
      t.string :logradouro
      t.string :cep
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :matricula
      t.string :cri
      t.string :observacoes

      t.timestamps null: false
    end
  end
end
