class AddRefToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :seller_id, null: false, foreign_key: true
    add_reference :transactions, :buyer_id, null: false, foreign_key: true
    add_reference :transactions, :post, null: false, foreign_key: true
  end
end
