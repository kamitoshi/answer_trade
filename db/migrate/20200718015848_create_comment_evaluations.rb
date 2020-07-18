class CreateCommentEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_evaluations do |t|
      t.references :student, foreign_key: true
      t.references :comment, foreign_key: true
      t.boolean :is_good, default: false

      t.timestamps
    end
    add_index :comment_evaluations, [:student_id, :comment_id], unique: true
  end
end
