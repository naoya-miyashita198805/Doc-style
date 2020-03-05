class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :document
  validates :user_id, uniqueness: { scope: :document_id }
  # ここはカピバラを用いたビューのテストでやるのが良いかも
  # 上のバリデーションは一つの資料に対しユーザーは一つしかお気に入り登録できないということ
end
