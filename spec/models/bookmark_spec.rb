require "rails_helper"
RSpec.describe Bookmark, type: :model do
  describe '#create' do
      it "Bookmarkができる" do
        expect(build(:bookmark)).to be_valid
      end
      
      it "Bookmarkができない user_id" do
        bookmark = build(:bookmark, user_id: nil)
        bookmark.valid?
        expect(bookmark.errors[:user]).to include("must exist")
      end

      it "Bookmarkができない document_id" do
        bookmark = build(:bookmark, document_id: nil)
        bookmark.valid?
        expect(bookmark.errors[:document]).to include("must exist")
      end

      # it "Bookmarkは一つの資料に一つまでしか保存できない" do
      #   bookmark = create(:bookmark)
      #   # まずはDBに一つbookmarkを生成
      #   another_bookmark = build(:bookmark, document_id: document_id)
      #   another_bookmark.valid?
      #   expect(another_bookmark.error[:document]).to include()
      #   # validate_uniqueness_of(:user_id).scoped_to(:document_id)
      #   # it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:document_id) }
      # ここはメンターさん曰くビューのテストで行った方が良い
      # 基本railsのnull: falseとかはテストはやったら素晴らしい感じと見受けられた
      # end
  end

  describe '#destroy' do
    it "Bookmarkを解除する" do
      expect(build(:bookmark)).to be_valid
    end
  end
end