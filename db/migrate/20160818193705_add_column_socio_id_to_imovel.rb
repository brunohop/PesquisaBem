class AddColumnSocioIdToImovel < ActiveRecord::Migration
  def change
    add_column :imovels, :socio_id, :integer
  end
end
