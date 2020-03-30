# co-workout
co-workoutはユーザーとフィットネストレーナーの出会いの場を効率良く提供することを目的としたマッチングアプリです。<br>
This app enables people to hire their own personal coach of fitness easily and coaches to find their customers efficiently.<br>
# overview
・ユーザーとコーチ（以下トレーナーと同義として扱う）はそれぞれアカウントを持ち、専用の画面から新規登録/ログインを行います。<br>
Users and coaches can login and sign up to this app through each designated screen.<br>
・ユーザーはコーチを、コーチはユーザーを検索し、選択することができます。<br>
Users can search their own coaches and choose them while coaches also can find their customers on this app.<br> 
・ユーザーとコーチは選択したアカウントをチャットを開始することができます。<br>
Users and coaches can talk with their trainers or customers who they chose on this app.<br> 
# background（porposes and reasons for creating this app）
・趣味でフィットネスに熱中しており、世間、特にビジネスマンにより浸透すれば良いと考えているため。<br>
I'm into fitness as my hobby and I think that it's siginificant for people,especialy business people to exercise and manage their meals for their healthy body and mental.<br>
・周囲の人々から自分一人で運動や食事管理を続けることが難しいのでパーソナルトレーナーを利用することも考えたが、料金も高く、またどこで依頼すればいいかわからないという声を頻繁に聞いたため。<br>
Some of my friends said to me that it's too dificult for them to make it habit to exercise and manage their meals on their own.So they once thought they wanted to hire their coaches,but it was too expensive and they didn't know where they should find their coaches.<br>
・パーソナルトレーナーとして活動を行う知人達から顧客獲得における費用・手間の負担が大きく苦労しているという話を聞いたため。<br> 
Some of my friends who work as personal trainers said that they are in trouble with burdens of expense to continue their tasks and tremendous time to find their customers.<br>
# points
・ログイン画面をuserとcoachの二種類を用意したこと。<br>
Create screens of login for both of users and coaches.<br>
・それぞれがuserとcoachを検索し、選択できるようにしたこと。<br>
This app enable users and coaches to search and choose their business partners.<br>
・GoogleMapのAPIを用いてチャット画面から手軽に地図を開けるようにしたこと。<br>
Installed Google Map API and uesrs and coaches can easily use map from their chats' screen.<br>
# future fanction
・ユーザーとコーチのマイページを実装・充実させる<br>
Create user's and coach's "My Page".<br>
・コーチの評価機能（五段階程度を予定）を実装<br>
Add the fanction to evaluate coaches.(I will make like stars of 5 phases )<br>
・ransakを用いた条件検索（年齢、性別、資格の有無、評価等）の実装<br>
Add the fanction to search coaches under paticular conditions with "ransack"(conditions mean "age","sex","qualification","evaluation"etc)<br>
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

## coachesテーブル
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
