class CreateJoinTableAlbumsSongs < ActiveRecord::Migration[5.2]
  def change
    create_join_table :albums, :songs do |t|
      t.index [:album_id, :song_id]
      t.index [:song_id, :album_id]
    end
  end
end
