class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :amount, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
