class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :amount
      t.string :commenter
      t.boolean :accept, default: false
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
