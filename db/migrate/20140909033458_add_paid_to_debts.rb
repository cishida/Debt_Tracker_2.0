class AddPaidToDebts < ActiveRecord::Migration
  def change
    change_table :debts do |t|
      t.boolean :paid, default: false
    end
  end
end
