class AddPricePerDayToVans < ActiveRecord::Migration[5.2]
  def change
    add_column :vans, :price_per_day, :integer
  end
end
