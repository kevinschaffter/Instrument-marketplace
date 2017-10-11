class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :category
      t.string :country
      t.decimal :price

      t.timestamps
    end
  end
end
