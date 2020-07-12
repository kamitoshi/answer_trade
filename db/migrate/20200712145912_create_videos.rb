class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :student, foreign_key: true
      t.references :request, foreign_key: true
      t.integer :academic_stage, null: false
      t.integer :subject, null: false
      t.integer :subject_content, null: false
      t.string :title, null: false
      t.string :content
      t.text :detail
      t.integer :count, default: 0

      t.timestamps
    end
    add_index :videos, :title
    add_index :videos, :subject
    add_index :videos, :subject_content
  end
end
