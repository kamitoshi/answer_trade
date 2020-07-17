class CreateReplyTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_tweets do |t|
      t.references :student, foreign_key: true
      t.references :tweet, foreign_key: true
      t.text :detail, null: false

      t.timestamps
    end
  end
end
