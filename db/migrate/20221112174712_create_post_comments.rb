class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.references :end_user, null: false, foreign_key: true
      t.references :sweets_revue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
