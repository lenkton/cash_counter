class CreateProcurementLots < ActiveRecord::Migration[6.0]
  def change
    create_table :procurement_lots do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
