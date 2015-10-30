class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :products
      t.string :prepration

      t.timestamps null: false
    end
  end
end
