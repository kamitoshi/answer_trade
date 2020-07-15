class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :student, foreign_key: true
      t.references :request, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :academic_stage, null: false
      t.string :title, null: false
      t.string :content
      t.text :detail

      t.timestamps
    end
    add_index :videos, :title
  end
end
