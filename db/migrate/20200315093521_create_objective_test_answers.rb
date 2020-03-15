class CreateObjectiveTestAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :objective_test_answers do |t|
      t.integer :extent
      t.references :user
      t.references :objective_test

      t.timestamps
    end
  end
end
