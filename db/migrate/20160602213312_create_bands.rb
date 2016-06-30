class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.timestamps null: false

      t.index :name, unique: true
    end
  end
end
