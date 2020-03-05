require "rails_helper"
describe User do
  describe '#create' do
    it "全て値が入っていれば登録できる" do
      user = build(:user)
      # binding.pry ここでも使える
      expect(user).to be_valid

      # expect(build(:user)).to be_valid 左のように1行でまとめて書くことができる！
      # ちなみに .to be_validを用いる場合バリデーションに引っかかるかどうかの
      # user.valid?の表記は当然ない
    end

    it "nameが空なら登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "emailが空欄なら登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordが空欄なら登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationが空欄なら登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "nameが７文字以上は登録できない（user.rbのバリデーションにそのように記載したから） " do
      user = build(:user, name: "aaaaaaaa")
                                        # ↑factory＿botからの上書き可能
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 6 characters)")
    end

    it "ならば逆にnameが6文字以下は登録できる " do
      user = build(:user, name: "aaaaaa")
                                    # ↑factory＿botからの上書き可能
      user.valid?
      expect(user).to be_valid
                                          # ↑特にrailsのgemのエラーメッセージの記載はない場合はこんな感じのお記述
    end

    it "同じemailの登録はできない" do
      user = create(:user)
              # ↑はDBに実際に記録される場合の検証で使う(buildではなくcreate)つまりこの記述がログインしているユーザーという記載になる！
              # この user = create(:user)の記述は覚えておくべし！ちなみにcurrent_user並みに使えるメソッドだと思う。
      another_user = build(:user, email: user.email)
                                          #読み順１ ↑これは上記で保存されたusersテーブルのemailということこれが
                                  #読み順２↑それがanother_userのemailとしての値定義することで another_userとuserのemailは同じと定義できる！
                                          # を比較してどうよっていうテスト内容
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが6文字以上であれば登録できる" do
      user = build(:user, password: "000000", password_confirmation: "000000")
                              # ↑二つ書くこともできる！
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できない" do
      user = build(:user, password: "00000", password_confirmation: "00000")
                              # ↑二つ書くこともできる！
      user.valid?
      expect(user.errors[:password]).to include()
                                              # ↑以下"is too short (minimum is 6 characters)"を入れなくても正常にテストコードは実行される
    end
    # userテストコード全てエラーなし
  end
end
