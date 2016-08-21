class AddColumnEmpresaIdToAnexo < ActiveRecord::Migration
  def change
    add_column :anexos, :empresa_id, :integer
  end
end
