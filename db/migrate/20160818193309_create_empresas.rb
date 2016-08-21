class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :cnpj
      t.string :cidade
      t.string :uf
      t.string :razaoSocial

      t.timestamps null: false
    end
  end
end
