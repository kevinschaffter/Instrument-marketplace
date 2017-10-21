class RemoveCategoryFromListings < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :category, :string
  end
end
