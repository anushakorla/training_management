class AddEndDateToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :end_date, :date
  end
end
