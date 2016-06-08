class AddUserToSubmit < ActiveRecord::Migration
  def change
    add_reference :submits, :user, index: true, foreign_key: true
  end
end
