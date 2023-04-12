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
  
users = User.create!(
  [
    {email: 'okitasouji@example.com', user_name: '沖田掃除', password: 'okitasouji', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/galaxy.jpg"), filename:"galaxy.jpg")},
    {email: 'hatakikakasi@example.com', user_name: 'はたき案山子', password: 'hatakikakasi', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/japanese_umbrella.jpg"), filename:"japanese_umbrella.jpg")},
    {email: 'osoujimenndoi@example.com', user_name: 'お掃除めんどい', password: 'osoujimenndoi', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/yawn_dog.jpg"), filename:"yawn_dog.jpg")},
    {email: 'keroronjyuusou@example.com', user_name: 'ケロロン重曹', password: 'keroronjyuusou', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/rainbow.jpg"), filename:"rainbow.jpg")},
    {email: 'broom5@example.com', user_name: 'broom', password: 'broom5', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/tulip.jpg"), filename:"tulip.jpg")},
    {email: 'araidoryuu@example.com', user_name: '洗戸 流', password: 'araidoryuu', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/cloud.jpg"), filename:"cloud.jpg")},
    {email: 'kajiyuuki@example.com', user_name: '家事ゆうき', password: 'kajiyuuki', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/red_rose.jpg"), filename:"red_rose.jpg")},
    {email: 'yukauehukiko@example.com', user_name: '床上拭き子', password: 'yukauehukiko', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/rose.jpg"), filename:"rose.jpg")},
    {email: 'rodmatui@example.com', user_name: 'ロッドまつい', password: 'rodmatui', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/shrine.jpg"), filename:"shrine.jpg")},
    {email: 'suponjibobii@example.com', user_name: 'スポンジ・ボビー', password: 'suponjibobii', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/manjyuu.jpg"), filename:"manjyuu.jpg")},
    {email: 'olivia@example.com', user_name: 'olivia', password: 'olivia', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/duck_bath.jpg"), filename:"duck_bath.jpg")},
    {email: 'james12@example.com', user_name: 'james', password: 'james12', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/chihuahua.jpg"), filename:"chihuahua.jpg")},
    {email: 'lucas13@example.com', user_name: 'Lucas', password: 'Lucas13', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_image/expand_chihuahua.jpg"), filename:"expand_chihuahua.jpg")}
  ]
)

posts = Post.create!(
  [
    {title: 'エアコンの掃除', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/air_conditioner.jpg"), filename:"air_conditioner.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: '綺麗なお風呂を保つ方法', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/beautiful_bath.jpg"), filename:"beautiful_bath.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: 'ダイニングキッチン', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/dining_kitchen.jpg"), filename:"dining_kitchen.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: '風呂の排水溝', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/drain.jpg"), filename:"drain.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: '玄関の掃除の仕方', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/front_door.jpg"), filename:"front_door.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: 'リビング', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/living.jpg"), filename:"living.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: 'ユニットバス掃除', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/modular_bath.jpg"), filename:"modular_bath.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: '水回りヌメヌメ撃退法', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/modular_bath.jpg"), filename:"modular_bath.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: 'ピカピカシンク', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/sink.jpg"), filename:"sink.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: 'コンロの油汚れ', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/stove.jpg"), filename:"stove.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: 'トイレの輪っか防止', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/toilet.jpg"), filename:"toilet.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[1].id },
    {title: '独立洗面台水あか予防', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/wash_basin.jpg"), filename:"wash_basin.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[2].id },
    {title: '窓のサッシ', post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post_image/window.jpg"), filename:"window.jpg"), introduction: 'いつものエアコン掃除です。', user_id: users[2].id },
    
  ]
)

CleaningRecipe.create!(
  [
    {cleaning_recipe: 'エアコンのカバーを外して、フィルターの表面に掃除機をかけます。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/air_conditioner_clean.jpg"), filename:"air_conditioner_clean.jpg"), 
    post_id: posts[0].id },
    {cleaning_recipe: 'フィルターを外して水洗いします。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/air_conditioner_clean.jpg"), filename:"air_conditioner_clean.jpg"), 
    post_id: posts[0].id },
    {cleaning_recipe: 'フィルターの乾燥中にエアコン内外部のホコリを取リます。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/air_conditioner_clean.jpg"), filename:"air_conditioner_clean.jpg"), 
    post_id: posts[0].id },
    {cleaning_recipe: '乾いたフィルターをセットします。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/air_conditioner_clean.jpg"), filename:"air_conditioner_clean.jpg"), 
    post_id: posts[0].id },
    
    {cleaning_recipe: '浴槽の栓を抜いてお湯を流す。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/bath_cleaning.jpg"), filename:"bath_cleaning.jpg"), 
    post_id: posts[1].id },
    {cleaning_recipe: 'お湯がなくなるのを待っている間に、シャワーで床や壁、収納棚などを水かお湯で洗い流す。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/bath_cleaning.jpg"), filename:"bath_cleaning.jpg"), 
    post_id: posts[1].id },
    {cleaning_recipe: '浴槽内はスポンジで洗う。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/bath_cleaning.jpg"), filename:"bath_cleaning.jpg"), 
    post_id: posts[1].id },
    {cleaning_recipe: '最後に水で流す。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/bath_cleaning.jpg"), filename:"bath_cleaning.jpg"), 
    post_id: posts[1].id },
    
    {cleaning_recipe: 'シンク全体に重曹をお好みの量だけ振りかけます。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/sink_cleaning.jpg"), filename:"sink_cleaning.jpg"), 
    post_id: posts[2].id },
    {cleaning_recipe: '重曹をかけた部分を濡れたスポンジでクルクルと円を描くように磨き拭きます。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/sink_cleaning.jpg"), filename:"sink_cleaning.jpg"), 
    post_id: posts[2].id },
    {cleaning_recipe: '水で流します。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/sink_cleaning.jpg"), filename:"sink_cleaning.jpg"), 
    post_id: posts[2].id },
    
    {cleaning_recipe: 'パイプユニッシュをかける。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/drain.jpg"), filename:"drain.jpg"), 
    post_id: posts[3].id },
    {cleaning_recipe: '2、30分置いて水で洗い流す。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/drain.jpg"), filename:"drain.jpg"), 
    post_id: posts[3].id },
    
    {cleaning_recipe: 'まずはドアを開け、通気をよくします。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/front_door_cleaning.jpg"), filename:"front_door_cleaning.jpg"), 
    post_id: posts[4].id },
    {cleaning_recipe: 'ほうきで砂、土ボコリを集めて、ちりとりで取ります。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/front_door_cleaning.jpg"), filename:"front_door_cleaning.jpg"), 
    post_id: posts[4].id },
    
    {cleaning_recipe: '天井、電気やカーテンレール、壁、エアコンの上など高いところのほこりを取る。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/light_cleaning.jpg"), filename:"light_cleaning.jpg"), 
    post_id: posts[5].id },
    {cleaning_recipe: '床をクイックルワイパーで拭き取る。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/light_cleaning.jpg"), filename:"light_cleaning.jpg"), 
    post_id: posts[5].id },
    
    {cleaning_recipe: '浴槽はスポンジと洗剤で洗います。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/toilet_cleaning.jpg"), filename:"toilet_cleaning.jpg"), 
    post_id: posts[6].id },
    {cleaning_recipe: 'トイレ部分は洗剤をまき、ブラシで汚れを落とします。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/toilet_cleaning.jpg"), filename:"toilet_cleaning.jpg"), 
    post_id: posts[6].id },
    {cleaning_recipe: '水で流します。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/toilet_cleaning.jpg"), filename:"toilet_cleaning.jpg"), 
    post_id: posts[6].id },
    
    {cleaning_recipe: 'ぬめりに重曹またはセスキ炭酸ソーダを振りかける。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/drain.jpg"), filename:"drain.jpg"), 
    post_id: posts[7].id },
    {cleaning_recipe: '振りかけた場所に少量の水またはぬるま湯を振りかける。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/drain.jpg"), filename:"drain.jpg"), 
    post_id: posts[7].id },
    {cleaning_recipe: '泡立ちを確認したら30分～1時間ほど放置する。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/drain.jpg"), filename:"drain.jpg"), 
    post_id: posts[7].id },
    {cleaning_recipe: '水で流す。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/drain.jpg"), filename:"drain.jpg"), 
    post_id: posts[7].id },
    
    {cleaning_recipe: '40～50℃くらいのお湯を洗いおけにためます。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/sink_cleaning.jpg"), filename:"sink_cleaning.jpg"), 
    post_id: posts[8].id },
    {cleaning_recipe: '酸素系漂白剤を説明書きの通りに溶かして漂白剤溶液をつくります。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/sink_cleaning.jpg"), filename:"sink_cleaning.jpg"), 
    post_id: posts[8].id },
    {cleaning_recipe: '漂白剤溶液に浸しゆるく絞ったふきんでステンレスの目に沿って拭き、汚れを落としていきます。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/sink_cleaning.jpg"), filename:"sink_cleaning.jpg"), 
    post_id: posts[8].id },
    {cleaning_recipe: 'ふきんを一度水に浸してゆるく絞った後、汚れや漂白剤を拭き取っていきます。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/sink_cleaning.jpg"), filename:"sink_cleaning.jpg"), 
    post_id: posts[8].id },
    {cleaning_recipe: '乾いたふきんで水気を拭き取ります。。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/sink_cleaning.jpg"), filename:"sink_cleaning.jpg"), 
    post_id: posts[8].id },
    
    {cleaning_recipe: '重曹水を振りかけて拭き取る。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/stove_illust.png"), filename:"stove_illust.jpg"), 
    post_id: posts[9].id },
    {cleaning_recipe: '汚れのひどい箇所には重曹ペーストをすり込み、30分ほど放置した後にキッチンペーパーなどで拭き取る。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/stove_illust.png"), filename:"stove_illust.jpg"), 
    post_id: posts[9].id },
    
    {cleaning_recipe: 'トイレブラシで水を押し込み、水位を下げる。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/toilet_cleaning.jpg"), filename:"toilet_cleaning.jpg"), 
    post_id: posts[10].id },
    {cleaning_recipe: 'トイレットペーパーをしき、上から洗剤をかける。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/toilet_cleaning.jpg"), filename:"toilet_cleaning.jpg"), 
    post_id: posts[10].id },
    {cleaning_recipe: 'そのまま2～3分置く。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/toilet_cleaning.jpg"), filename:"toilet_cleaning.jpg"), 
    post_id: posts[10].id },
    {cleaning_recipe: 'トイレブラシでこすり、水で流す。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/toilet_cleaning.jpg"), filename:"toilet_cleaning.jpg"), 
    post_id: posts[10].id },
    
    {cleaning_recipe: '水で湿らせたメラミンフォームのスポンジを使って、洗面ボウルをこすります。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/wash_basin.jpg"), filename:"wash_basin.jpg"), 
    post_id: posts[11].id },
    {cleaning_recipe: 'ボウルに水をかけ、汚れを洗い流します。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/wash_basin.jpg"), filename:"wash_basin.jpg"), 
    post_id: posts[11].id },
    {cleaning_recipe: '乾いたぞうきんで洗面ボウル全体の水気を拭き取り、掃除完了です。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/wash_basin.jpg"), filename:"wash_basin.jpg"), 
    post_id: posts[11].id },
    
    {cleaning_recipe: '歯ブラシもしくは小型の掃除機を使ってほこりをかき出す。', 
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/window_cleaning.jpg"), filename:"window_cleaning.jpg"), 
    post_id: posts[12].id },
    {cleaning_recipe: '雑巾やキッチンペーパーで水拭きしていく。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/window_cleaning.jpg"), filename:"window_cleaning.jpg"), 
    post_id: posts[12].id },
    {cleaning_recipe: '汚れがとれたら、キッチンペーパーで水気を拭き取る。',
    recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/recipe_image/window_cleaning.jpg"), filename:"window_cleaning.jpg"), 
    post_id: posts[12].id }
  ]
)

CleaningTool.create!(
  [
    {cleaning_tool_name: '使い古した歯ブラシ', post_id: posts[0].id },
    {cleaning_tool_name: '乾いたキレイなタオル2枚', post_id: posts[0].id },
    {cleaning_tool_name: '中性洗剤（食器用洗剤など）', post_id: posts[0].id },
    
    {cleaning_tool_name: 'スポンジ', post_id: posts[1].id },
    
    {cleaning_tool_name: '重曹', post_id: posts[2].id },
    {cleaning_tool_name: 'スポンジ', post_id: posts[2].id },
    
    {cleaning_tool_name: 'パイプユニッシュ', post_id: posts[3].id },
    
    {cleaning_tool_name: 'ほうき', post_id: posts[4].id },
    {cleaning_tool_name: 'ちりとり', post_id: posts[4].id },
    
    {cleaning_tool_name: 'はたき', post_id: posts[5].id },
    {cleaning_tool_name: 'クイックルワイパー', post_id: posts[5].id },
    
    {cleaning_tool_name: 'スポンジ', post_id: posts[6].id },
    {cleaning_tool_name: 'トイレ用ブラシ', post_id: posts[6].id },
    {cleaning_tool_name: '中性洗剤（風呂用とトイレ用）', post_id: posts[6].id },
    
    {cleaning_tool_name: '重曹またはセスキ炭酸ソーダ', post_id: posts[7].id },
    
    {cleaning_tool_name: '酸素系漂白剤', post_id: posts[8].id },
    {cleaning_tool_name: 'クリームクレンザー', post_id: posts[8].id },
    {cleaning_tool_name: 'ふきん', post_id: posts[8].id },
    {cleaning_tool_name: '洗いおけ', post_id: posts[8].id },
    {cleaning_tool_name: 'スポンジ', post_id: posts[8].id },
    {cleaning_tool_name: 'ゴム手袋', post_id: posts[8].id },
    
    {cleaning_tool_name: '重曹', post_id: posts[9].id },
    
    {cleaning_tool_name: 'アルカリ性洗剤', post_id: posts[10].id },
    {cleaning_tool_name: 'トイレットペーパー', post_id: posts[10].id },
    {cleaning_tool_name: 'トイレブラシ', post_id: posts[10].id },
    {cleaning_tool_name: 'ゴム手袋', post_id: posts[10].id },
    
    {cleaning_tool_name: 'メラミンフォームのスポンジ', post_id: posts[11].id },
    {cleaning_tool_name: 'ぞうきん', post_id: posts[11].id },
    
    {cleaning_tool_name: '使い古した歯ブラシ', post_id: posts[12].id },
    {cleaning_tool_name: '掃除機', post_id: posts[12].id },
    {cleaning_tool_name: '雑巾もしくはキッチンペーパー', post_id: posts[12].id },
    
  ]
)
