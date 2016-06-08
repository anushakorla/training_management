class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title
      t.text :description
      t.string :duration
      t.string :date

      t.timestamps null: false
    end
  end
end
