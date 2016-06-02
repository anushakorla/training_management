class AddAttachmentToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :attachment, :string
  end
end
