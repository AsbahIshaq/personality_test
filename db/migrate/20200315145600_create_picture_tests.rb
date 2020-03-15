class CreatePictureTests < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_tests do |t|
      t.string :image_url
      t.string :title

      t.timestamps
    end
  end
end
