class CreateTrees < ActiveRecord::Migration[5.0]
  def change
    create_table :trees do |t|
      t.string :name
      t.string :address
      t.decimal :latitude, precision: 9, scale: 7
      t.decimal :longitude, precision: 9, scale: 7
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :trees, [:user_id, :created_at]
  end
end
