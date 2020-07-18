class CreateTweetEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_evaluations do |t|
      t.references :student, foreign_key: true
      t.references :tweet, foreign_key: true
      t.boolean :is_good

      t.timestamps
    end
    add_index :tweet_evaluations, [:student_id, :tweet_id], unique: true
  end
end
