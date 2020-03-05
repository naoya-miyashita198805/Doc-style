FactoryBot.define do
  factory :bookmark do
    # ここは中間テーブルのファクトリーです
    user
    document
    # 記述的にはどちらが正しいのか？上と下どちらも正しい！
    # association :document, factory: :document
    # association :user, factory: :user

    # 両方外部キー
  end
end