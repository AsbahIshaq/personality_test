class CreatePictureTestAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_test_answers do |t|
      t.integer :extent
      t.integer :user_id
      t.integer :picture_test_id

      t.timestamps
    end
  end
end
