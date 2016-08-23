class RemoveArquivoFromAnexo < ActiveRecord::Migration
  def change
    remove_column :anexos, :arquivo, :binary
  end
end
