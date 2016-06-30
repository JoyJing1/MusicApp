class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :band_id, null: false
      t.string :record_type, null: false

      t.timestamps null: false
      t.index :band_id
      t.index :name, unique: true
    end
  end
end
