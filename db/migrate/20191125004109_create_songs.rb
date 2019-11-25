class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name, null: false, default: ''
      t.string :preview_url
      t.integer :duration_ms, null: false, default: 0
      t.boolean :explicit
      t.string :spotify_url
      t.string :spotify_id, null: false, default: ''

      t.timestamps
    end
  end
end
