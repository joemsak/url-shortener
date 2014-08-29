class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long
      t.string :shortened_hash

      t.timestamps
    end
    add_index :urls, :shortened_hash
  end
end
