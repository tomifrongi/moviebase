class CreateSources < ActiveRecord::Migration[7.1]
  def change
    create_table :sources do |t|
      t.string :format
      t.string :path
      t.string :runtime

      t.timestamps
    end
  end
end
