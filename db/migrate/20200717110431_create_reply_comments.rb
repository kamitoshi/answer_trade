class CreateReplyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_comments do |t|
      t.references :student, foreign_key: true
      t.references :comment, foreign_key: true
      t.text :detail, null: false

      t.timestamps
    end
  end
end
