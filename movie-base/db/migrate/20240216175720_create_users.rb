class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :document
      t.string :document_type
      t.date :birth_date

      t.timestamps
    end
  end
end
