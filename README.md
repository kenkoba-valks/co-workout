# co-workout
co-workoutはユーザーとフィットネストレーナーの出会いの場を効率良く提供することを目的としたマッチングアプリです。<br>
<br>
[動作確認用本番環境]
URL: https://co-workout.herokuapp.com/<br>
[ユーザーログイン用アカウント]<br>
email:aaaa@gmail.com<br>
pass:aaaaaaa<br>
[コーチログイン用アカウント]<br>
email:bbbb@gmail.com<br>
pass:bbbbbbb<br>
# overview
①ユーザーとコーチ（以下トレーナーと同義として扱う）はそれぞれアカウントを持ち、専用の画面から新規登録/ログインを行います。<br>
<img width="897" alt="login_for_user" src="https://user-images.githubusercontent.com/60640640/77883459-233fbb80-729e-11ea-898b-46fa4e64215e.png"><br>
<img width="772" alt="login_for_coach" src="https://user-images.githubusercontent.com/60640640/77883455-2175f800-729e-11ea-85c8-c3a9938f5a51.png"><br>
②ユーザーはコーチを、コーチはユーザーを検索し、選択することができます。<br>
<img width="1431" alt="choose-coach" src="https://user-images.githubusercontent.com/60640640/77883574-5d10c200-729e-11ea-87bb-a3f4891b555f.png"><br>
③ユーザーとコーチは選択したアカウントとチャットを開始することができます。<br>
<img width="1431" alt="message" src="https://user-images.githubusercontent.com/60640640/77883604-6e59ce80-729e-11ea-8ed2-160303264264.png"><br>
# background（porposes and reasons for creating this app）
・趣味でフィットネスに熱中しており世の中、特にビジネスマンにより浸透すれば良いと考えているため。<br>
・周囲の人々から自分一人で運動や食事管理を続けることが難しいのでパーソナルトレーナーを利用することも考えたが、料金も高く、またどこで依頼すればいいかわからないという声を頻繁に聞いたため。<br>
・パーソナルトレーナーとして活動を行う知人達から顧客獲得における費用・手間の負担が大きく苦労しているという話を聞いたため。<br> 
# points
・ログイン画面をuserとcoachの二種類を用意したこと。<br>
・sessionを利用し、新規登録時に住所情報も同時に登録できるようにしたこと。<br>
<img width="650" alt="sign-up" src="https://user-images.githubusercontent.com/60640640/77883880-f344e800-729e-11ea-8649-1db5871d2d57.png"><br>
<img width="617" alt="address" src="https://user-images.githubusercontent.com/60640640/77883885-f4761500-729e-11ea-8d74-9cc9e4dacfb5.png"><br>
・それぞれがuserとcoachを検索し、選択できるようにしたこと。<br>
・GoogleMapのAPIを用いてチャット画面から手軽に地図を開けるようにしたこと。<br>
![map](https://user-images.githubusercontent.com/60640640/77884003-2dae8500-729f-11ea-9a5b-94d5f3698582.jpg)<br>
# future fanction
・ユーザーとコーチのマイページを実装・充実させる<br>
・コーチの評価機能（五段階程度を予定）を実装<br>
・ransakを用いたコーチの条件検索（年齢、性別、資格の有無、評価等）の実装<br>
# environment
・ruby 2.5.1
# DB
## usersテーブル ※gem deviseを利用する
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, default: ""|  ※devise導入時に自動生成
|encrypted_password,|string|null: false, default: ""|             ※devise導入時に自動生成
|family_name|string|null: false|            
|first_name|string|null: false|         
|family_name_kana|string|null: false|          
|first_name_kana|string|null: false|            
|birth_day|date|null: false|   
|age|date| - |  
|request|text| - |  
|image|string| - |  

### Association
- has_many :coach_users
- has_many :coaches, through: :coach_users
- has_many :messages
- has_one :address

<!-- ------------------------------------- -->

## coach_usersテーブル
|Column|Type|Options|
|------|----|-------|
|coach_id|bigint|foreign_key:true|
|user_id|bigint|foreign_key:true|

### Association
belongs_to :user
belongs_to :coach
<!-- ------------------------------------- -->

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key:true|
|coach_id|bigint|foreign_key:true|
|image|string| - |
|content|string| null: false |

### Association
- belongs_to :user
- belongs_to :coach
<!-- ------------------------------------- -->

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key:true|
|item_id|bigint|foreign_key:true|
|popstal_code|interger|null: false|
|prefecture|string|null: false|
|building_name|string| - |
|phone_number|string|null: false|

### Association
belongs_to :user, optional: true
belongs_to :coach, optional: true

<!-- ------------------------------------- -->

## coachesテーブル ※gem deviseを利用する
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, default: ""|  ※devise導入時に自動生成
|encrypted_password,|string|null: false, default: ""|             ※devise導入時に自動生成
|family_name|string|null: false|            
|first_name|string|null: false|         
|family_name_kana|string|null: false|          
|first_name_kana|string|null: false|            
|birth_day|date|null: false|   
|age|date|null:false|  
|request|text|null:false|  
|image|string| - |  

### Association
-  has_many :coach_users
-  has_many :users, through: :coach_users
-  has_many :messages
-  has_one :address

<!-- ------------------------------------- -->
