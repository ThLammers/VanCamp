class AddPhotoToVans < ActiveRecord::Migration[5.2]
  def change
    add_column :vans, :photo, :string
  end
end
