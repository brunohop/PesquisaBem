class AddColumnDescricaoToAnexo < ActiveRecord::Migration
  def change
    add_column :anexos, :descricao, :string
  end
end
