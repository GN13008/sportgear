class CreateKiteParameters < ActiveRecord::Migration[6.1]
  def change
    create_table :kite_parameters do |t|
      t.string :name
      t.integer :rate
      t.references :kite, foreign_key: true

      t.timestamps
    end
  end
end
