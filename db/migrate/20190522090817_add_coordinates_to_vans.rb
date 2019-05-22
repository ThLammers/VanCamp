class AddCoordinatesToVans < ActiveRecord::Migration[5.2]
  def change
    add_column :vans, :latitude, :float
    add_column :vans, :longitude, :float
  end
end
