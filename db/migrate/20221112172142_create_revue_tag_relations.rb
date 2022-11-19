class CreateRevueTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :revue_tag_relations do |t|
      # references型 = カラムが他のテーブルを参照していることを示す
      # メリット：カラム名にidをつけてくれる(tag → tag_id),インデックスを自動で張ってくれる
      t.references :sweets_revue, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
