class AddColumnRestrictions < ActiveRecord::Migration
  def change
    change_column_null :albums, :name, false
    change_column_null :albums, :band_id, false
    change_column :albums, :record_type, :string, default: "studio"

    change_column :tracks, :song_type, :string, default: "regular"
  end
end
