class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :end_user, null: false, foreign_key: true
      t.references :sweets_revue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
