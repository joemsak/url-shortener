class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long, null: false
      t.string :shortened_hash, null: false

      t.timestamps
    end
    add_index :urls, [:long, :shortened_hash], unique: true
  end
end
