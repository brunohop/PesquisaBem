class CreateAnexos < ActiveRecord::Migration
  def change
    create_table :anexos do |t|
      t.binary :arquivo

      t.timestamps null: false
    end
  end
end
