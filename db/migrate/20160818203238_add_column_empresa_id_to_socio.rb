class AddColumnEmpresaIdToSocio < ActiveRecord::Migration
  def change
    add_column :socios, :empresa_id, :integer
  end
end
