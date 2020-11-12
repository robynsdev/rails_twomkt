class AddRefToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :seller, null: false, foreign_key: { to_table: 'users' }
    add_reference :transactions, :buyer, null: false, foreign_key: { to_table: 'users' }
    add_reference :transactions, :post, null: false, foreign_key: true
  end
end