class AddColumnEmpresaIdToImovel < ActiveRecord::Migration
  def change
    add_column :imovels, :empresa_id, :integer
  end
end
