class RemoveAcceptFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :accept, :boolean
  end
end
