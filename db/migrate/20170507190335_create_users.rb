class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :address
      t.string  :mobile
      t.date    :birthday
      t.string  :facebook
      t.string  :twitter
      t.string  :telegram
      t.timestamps null: false
    end
  end
end
