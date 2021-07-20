class CreateKites < ActiveRecord::Migration[6.1]
  def change
    create_table :kites do |t|
      t.string :model
      t.string :photo_url
      t.string :description
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
