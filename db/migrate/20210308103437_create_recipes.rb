class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :author
      t.text :ingredients
      t.text :directions
      t.string :category
      t.string :reference
      t.string :image
      t.text :note	
      t.timestamps
    end
  end
end
