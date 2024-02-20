class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|
      t.string :title
      t.string :genre
      t.date :release_date
      t.float :score

      t.timestamps
    end
  end
end
