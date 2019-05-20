class CreateVans < ActiveRecord::Migration[5.2]
  def change
    create_table :vans do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :brand
      t.string :category
      t.integer :seats
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
