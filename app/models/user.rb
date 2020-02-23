class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :documents, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_documents, through: :bookmarks, source: :document

  # お気に入り拡張コード（他人のも使える）
  # def own_document?(document)
  #   self.id == document.user_id
  # end

end
