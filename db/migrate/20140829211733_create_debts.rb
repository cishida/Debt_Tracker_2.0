class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.integer :amount
      t.string :reason

      t.timestamps
    end
  end
end
