class AddNameToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :name, :string
  end
end
