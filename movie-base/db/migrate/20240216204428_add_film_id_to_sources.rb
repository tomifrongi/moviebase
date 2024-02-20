class AddFilmIdToSources < ActiveRecord::Migration[7.1]
  def change
    add_reference :sources, :film, null: false, foreign_key: true
  end
end
