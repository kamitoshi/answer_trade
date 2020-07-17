class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :student, foreign_key: true
      t.references :community, foreign_key: true
      t.text :detail, null: false

      t.timestamps
    end
  end
end
