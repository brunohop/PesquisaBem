class AddColumnEmpresaIdToVeiculo < ActiveRecord::Migration
  def change
    add_column :veiculos, :empresa_id, :integer
  end
end
