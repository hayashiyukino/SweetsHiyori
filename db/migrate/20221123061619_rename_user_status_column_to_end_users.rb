class RenameUserStatusColumnToEndUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :end_users, :user_status, :is_deleted
  end
end
