class AddLoginIdToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :login_id, :string
  end
end
