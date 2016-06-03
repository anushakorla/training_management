class AddLevelToAttachment < ActiveRecord::Migration
  def change
    add_reference :attachments, :level, index: true, foreign_key: true
  end
end
