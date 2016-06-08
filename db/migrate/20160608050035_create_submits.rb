class CreateSubmits < ActiveRecord::Migration
  def change
    create_table :submits do |t|
      t.string :title
      t.string :code

      t.timestamps null: false
    end
  end
end
