class AddTestToSubmit < ActiveRecord::Migration
  def change
    add_reference :submits, :test, index: true, foreign_key: true
  end
end
