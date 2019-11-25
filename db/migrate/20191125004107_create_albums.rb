class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name, null: false, default: ''
      t.string :image
      t.integer :total_tracks, null: false, default: 0
      t.string :spotify_url
      t.string :spotify_id, null: false, default: ''

      t.timestamps
    end
  end
end
