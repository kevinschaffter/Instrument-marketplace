class AddCategoryIdToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :category_id, :string
  end
end
