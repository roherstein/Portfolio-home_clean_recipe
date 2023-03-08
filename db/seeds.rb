# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "admin@example.com", password: "clean14")
User.create(email: "guest@example.com", password: "guest14")

Category.create([{category_name: "キッチン"},{category_name: "浴室"},{category_name: "洗面所"},{category_name: "トイレ"},{category_name: "和室"},
  {category_name: "リビング・ダイニング"},{category_name: "寝室"},{category_name: "収納"},{category_name: "玄関"},{category_name: "窓"},
  {category_name: "天井・壁・床"},{category_name: "屋外"},{category_name: "家電系"},{category_name: "掃除機"},{category_name: "マイクロファイバークロス"},
  {category_name: "スポンジ"},{category_name: "中性洗剤"},{category_name: "ブラシ"},{category_name: "フロアワイパー"},
  {category_name: "クエン酸・重曹"},{category_name: "普段"},{category_name: "大掃除"},{category_name: "時短"},{category_name: "その他"}])