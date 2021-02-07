class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :host
      t.datetime :timestamp
      t.decimal :lat
      t.decimal :lon
      t.decimal :download_speed
      t.decimal :upload_speed
      t.integer :bytes_uploaded
      t.integer :bytes_downloaded
      t.decimal :ping_ms

      t.timestamps
    end
  end
end
