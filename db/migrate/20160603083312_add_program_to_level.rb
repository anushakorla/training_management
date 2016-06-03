class AddProgramToLevel < ActiveRecord::Migration
  def change
    add_reference :levels, :program, index: true, foreign_key: true
  end
end
