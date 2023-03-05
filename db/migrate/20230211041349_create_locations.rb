class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.timestamps
    end

    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :capacity
      t.references :location, foreign_key: true
      t.timestamps
    end
  end
end
