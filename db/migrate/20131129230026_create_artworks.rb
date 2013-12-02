class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :size
      t.string :medium
      t.float :price
      t.float :shipping_price
      t.text :summary

      t.timestamps
    end
  end
end
