# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'sweets@hiyori',
   password: '123456'
)

EndUser.create!(
   email: 'test@1',
   password: '789789',
   name: "testname",
   nickname: "tes"
)

#ジャンル名
Genre.create!(name:"洋菓子")
Genre.create!(name:"焼き菓子")
Genre.create!(name:"半生菓子")
Genre.create!(name:"和菓子")

#タグ名
Tag.create!(name:"洋菓子店")
Tag.create!(name:"デパート")
Tag.create!(name:"ホテル")
Tag.create!(name:"コンビニ")
Tag.create!(name:"かわいい")
Tag.create!(name:"おすすめ")
Tag.create!(name:"テイクアウト")
Tag.create!(name:"イートイン")
Tag.create!(name:"カフェ")
Tag.create!(name:"お土産")
Tag.create!(name:"ご褒美")
Tag.create!(name:"安い")