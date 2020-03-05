require "rails_helper"
RSpec.describe Document, type: :model do
  describe '#create' do
    context 'can save' do
      # この中にメッセージを保存できる場合のテストを記述
      it "titleのみの情報で保存できる" do
        # document = build(:document)
        # expect(document ).to be_valid
        # このように2行でも書ける

        expect(build(:document, image:  nil)).to be_valid
                          # buildでファクトリーボットの中身を呼び出しつつ
                          # その中のimageをnillに上書きしている。よってここでは
                          # 画像がなくてもファクトリーボットに記載した
                          # titleのみでも保存できるというテストコードになる
      end

      # it 'imageのみの情報で保存ができる' do
      #   expect(build(:document, title:  nil)).to be_valid
      # end
      # 上記は備忘録として残しておく。titleさえ入っていれば保存できる条件だった
      # 日記として活用する人のため

      it 'titleとimage両方で保存ができる' do
        expect(build(:document)).to be_valid
                          # これは特に上書きがない、つまりファクトリーボットない
                          # の情報通りに実行すると保存できるという事になる
      end
      # 自分のdocumentバリデーションはこれで完了
    end

    context 'can not save' do
      # この中にメッセージを保存できない場合のテストを記述
      it "commentのみの情報では保存できないtitle" do
        document = build(:document, title: nil, image: nil)
        document.valid?
        expect(document.errors[:title]).to include("can't be blank")
      end

      it "commentのみの情報では保存できないimage" do
        document = build(:document, title: nil, image: nil)
        document.valid?
        expect(document.errors[:image]).to include()
      end

      it 'user_idがないと保存できないこれはdokumentテーブルのカラム名' do
        document = build(:document, user_id: nil)
                                      # こっちはカラム名
        document.valid?
        expect(document.errors[:user]).to include("must exist")
                            # こっちはファクトリーボットないの記載？
      end

    end
  end
    # documentのテストコード完了
end