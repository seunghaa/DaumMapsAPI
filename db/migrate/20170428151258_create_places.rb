class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.integer :lat
      t.integer :lng
      t.text :description

      t.timestamps null: false
    end
  end
end
