class AddStartDateToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :start_date, :date
  end
end
