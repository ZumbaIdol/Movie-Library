class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :category
      t.string :rating

      t.timestamps null: false
    end
  end
end
