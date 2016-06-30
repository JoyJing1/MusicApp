class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.text :lyrics
      t.string :song_type, null: false

      t.timestamps null: false
    end
  end
end
