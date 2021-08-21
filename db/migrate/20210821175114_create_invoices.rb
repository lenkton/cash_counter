class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.float :amount, null: false
      t.string :name, null: false
      t.text :description
      t.references :user, null: false

      t.timestamps
    end
  end
end
