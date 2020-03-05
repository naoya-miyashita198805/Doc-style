FactoryBot.define do
  factory :document do
    title {"hello!"}
    image {"hoge.png"}
    comment {"fugafuga"}
    # 正直ファクトリーボットないの情報は上書きできるのでバリデーション関係なしに
    # 値は入れておくのが良い
    # 使いやすい
    user
    # ちなみにuser_idではエラーが起きる
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end