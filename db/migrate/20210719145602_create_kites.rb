class CreateKites < ActiveRecord::Migration[6.1]
  def change
    create_table :kites do |t|
      t.string :model
      t.string :photo_url

      t.timestamps
    end
  end
end
