class CreateSweetsRevues < ActiveRecord::Migration[6.1]
  def change
    create_table :sweets_revues do |t|
      t.integer :end_user_id, null: false
      t.integer :genre_id, null: false
      t.integer :revue_tag_relation_id
      t.integer :favorite_id
      t.integer :post_comment_id
      t.float   :review_star, null: false
      t.string  :sweets_name, null: false
      t.integer :tax_included_price, null: false
      t.text    :sweets_introduction
      t.string  :shop_name
      t.string  :buy_place
      t.boolean :post_status, null: false, default: true

      t.timestamps
    end
  end
end
