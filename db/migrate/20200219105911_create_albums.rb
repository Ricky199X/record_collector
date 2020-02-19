class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.date :release_date
      t.string :label
      t.string :cover_url
      t.integer :popularity

      t.timestamps
    end
  end
end
