class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :student, foreign_key: true
      t.references :follow, foreign_key: {to_table: :student}

      t.timestamps
      t.index [:student_id, :follow_id], unique: true
    end
  end
end
