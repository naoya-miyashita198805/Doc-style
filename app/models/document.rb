class Document < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  # validates :name, length: { maximum: 50 }, presence: true
  # validates :place, length: { maximum: 100 }, presence: true
  # validates :content, length: { maximum: 2000 }, presence: true
  # validates :start_time, presence: true
  # validates :end_time, presence: true
  # validate :start_time_should_be_before_end_time

  validates :title, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
  
  def self.search(search) #あるいはこちらのような書き方も可能、というかこっちの方がわかりやすい
    if search
      Document.where('title LIKE(?)', "%#{search}%").order("created_at DESC")
    else
      Document.all
    end
  end

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
    # documentがbookmarkしてあるかどうかを判定
  end
  
end
