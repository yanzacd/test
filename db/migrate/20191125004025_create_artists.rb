class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, null: false, default: ''
      t.string :image
      t.integer :popularity, null: false, default: 0
      t.string :spotify_url
      t.string :spotify_id, null: false, default: ''
      t.text :genres, null: false, array: true, default: []

      t.timestamps
    end
  end
end
