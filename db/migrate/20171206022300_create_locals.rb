class CreateLocals < ActiveRecord::Migration[5.0]
  def change
    create_table :locals do |t|
      t.string :name
      t.string :address
      t.decimal :latitude, precision: 9, scale: 7
      t.decimal :longitude, precision: 9, scale: 7
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
