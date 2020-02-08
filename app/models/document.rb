class Document < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
  
  def self.search(search) #あるいはこちらのような書き方も可能、というかこっちの方がわかりやすい
    if search
      Document.where('title LIKE(?)', "%#{search}%").order("created_at DESC")
    else
      Document.all
      
    end
  end
end
