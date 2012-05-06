class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.integer :user_id
      t.string :source

      t.timestamps
    end
  end
end
