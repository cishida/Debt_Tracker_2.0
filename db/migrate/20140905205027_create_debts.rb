class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.references :peasant
      t.references :lord
      t.decimal :amount
      t.text :reason
      t.timestamps
    end
  end
end
