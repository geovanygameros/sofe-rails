class ChangeTypeCommenter < ActiveRecord::Migration
  def change
    change_column :comments, :commenter, :text
  end
end
