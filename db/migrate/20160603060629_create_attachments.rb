class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :document

      t.timestamps null: false
    end
  end
end
