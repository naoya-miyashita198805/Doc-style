FactoryBot.define do
  factory :user do
    name              {"田中"}
    # 名前はfaker使わない方がいい。名前が長くなり設定したバリデーションに引っかかるため
    # sequence(:name) {Faker::Name.name}
    # email                 {"kkk@gmail.com"}
    # 下記のFakerが役割を受け持つ同じメールだと
    # バリデーションに引っかかるため。これはコントローラテストのため複数人が複数投稿といった条件を満たすため
    password              {"00000000"}  
    password_confirmation {"00000000"}

    # Fakerで記載しようとしたがうまくいかず
    # password = Faker::Internet.password(min_length: 8)
    # name = Faker::Name.name(min_length: 5)
    # email {Faker::Internet.free_email}
    # name {name}
    # password {password}
    # password_confirmation {password}
    sequence(:email) {Faker::Internet.email}
    # sequenceから打つとtest環境のDBがidから始まる連番の
    # テストデータになる！メリットは？
  end
end