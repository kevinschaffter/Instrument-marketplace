class AddConditionToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :condition, :string
  end
end
