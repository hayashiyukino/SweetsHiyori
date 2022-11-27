# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# rails db:seed -e production

admins = [
   {email: 'sweets@hiyori', password: '123456'},
]

admins.each do |admin|
   admin_data = Admin.find_by(email: admin[:email])
   if admin_data.nil?
      Admin.create(email: admin[:email], password: admin[:password])
   end
end


15.times do |num|
   user_data = EndUser.find_by(email: "test#{num + 1}@test")
   if user_data.nil?
      EndUser.create(
         email: "test#{num + 1}@test",
         password: "test#{num + 1}0000",
         name: "テスト名前#{num + 1}",
          nickname: "ニックネーム#{num + 1}"
      )
   end
end


genres = ['生菓子', '焼き菓子', '半生菓子', '和菓子', 'その他']
genres.each do |genre|
   Genre.find_or_create_by(name: genre)
end



tags = [
   '洋菓子店', 'デパート', 'ホテル', 'コンビニ', 'かわいい', 'おすすめ',
   'テイクアウト', 'イートイン',
   'カフェ', 'お土産', 'お手頃価格', 'パフェ', '映え', 'ボリューム', 'ご当地', 'おしゃれ',
   'その他'
]
tags.each do |tag|
   Tag.find_or_create_by(name: tag)
end