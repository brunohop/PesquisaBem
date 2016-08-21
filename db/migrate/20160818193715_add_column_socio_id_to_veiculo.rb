class AddColumnSocioIdToVeiculo < ActiveRecord::Migration
  def change
    add_column :veiculos, :socio_id, :integer
  end
end
