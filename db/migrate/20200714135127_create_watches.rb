class CreateWatches < ActiveRecord::Migration[5.2]
  def change
    create_table :watches do |t|
      t.references :student, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
    add_index :watches, [:student_id, :video_id], unique: true
  end
end
