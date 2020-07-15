class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :student, foreign_key: true
      t.references :video, foreign_key: true
      t.integer :high_low

      t.timestamps
    end
    add_index :evaluations, [:student_id, :video_id], unique: true
  end
end
