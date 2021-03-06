class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :release_date
      t.string :label
      t.string :cover_url
      t.integer :popularity
      t.integer :artist_id

      t.timestamps
    end
  end
end
