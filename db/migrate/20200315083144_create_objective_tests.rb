class CreateObjectiveTests < ActiveRecord::Migration[5.2]
  def change
    create_table :objective_tests do |t|
      t.string :question
    end
  end
end
