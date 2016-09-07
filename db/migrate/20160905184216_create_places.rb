class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :teaser, null: false

      t.timestamps
    end
  end
end
