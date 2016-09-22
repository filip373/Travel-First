class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.references :place, foreign_key: true
      t.string :title
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
