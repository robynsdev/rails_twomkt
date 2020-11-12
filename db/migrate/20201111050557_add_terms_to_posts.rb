class AddTermsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :sales, :string
    add_column :posts, :delivery, :string
  end
end
