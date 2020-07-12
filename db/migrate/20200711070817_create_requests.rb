class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :student, foreign_key: true
      t.integer :academic_stage, null: false
      t.integer :subject, null: false
      t.integer :subject_content, null: false
      t.string :title, null: false
      t.text :detail
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
