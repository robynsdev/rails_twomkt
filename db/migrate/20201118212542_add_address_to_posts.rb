class AddAddressToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :suburb, :string
    add_column :posts, :state, :string
  end
end
