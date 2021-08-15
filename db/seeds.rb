# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "naganocake@mail",
              password: "aaaaaa")
              
# Customer.create!(last_name:  "山田",
#             first_name: "花子",
#             last_name_kana: "ヤマダ",
#             first_name_kana: "ハナコ",
#             postal_code: "1234567",
#             address: "大阪府吹田市",
#             phone_number: "09012345678",
#             email: "hanako.yamada@email.com",
#             password: "abcdef",
#             password_confirmation: "abcdef")

# Customer.create!(last_name:  "鈴木",
#             first_name: "一朗",
#             last_name_kana: "スズキ",
#             first_name_kana: "イチロウ",
#             postal_code: "1111111",
#             address: "神奈川県藤沢市",
#             phone_number: "08012345678",
#             email: "ichiro.suzuki@email.com",
#             password: "hijklm",
#             password_confirmation: "hijklm")