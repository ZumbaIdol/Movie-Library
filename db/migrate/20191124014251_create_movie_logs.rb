class CreateMovieLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_logs do |t|
      t.integer :user_id
      t.integer :movie_id
      t.text_area :comments

      t.timestamps
    end
  end
end
