class AddLevelToTest < ActiveRecord::Migration
  def change
    add_reference :tests, :level, index: true, foreign_key: true
  end
end
