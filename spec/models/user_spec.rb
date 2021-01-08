require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,first_name,last_name,first_name_reading,last_name_reading,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角英数6文字以上であれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
      it "first_nameが全角かつひらがな、カナ、漢字のいずれかであれば登録できる" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "last_nameが全角かつひらがな、カナ、漢字のいずれかであれば登録できる" do
        @user.first_name = "山田"
        expect(@user).to be_valid
      end
      it "first_nameが全角かつカナであれば登録できる" do
        @user.first_name = "タロウ"
        expect(@user).to be_valid
      end
      it "first_nameが全角かつカナであれば登録できる" do
        @user.first_name = "ヤマダ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが全角かつひらがな、カナ、漢字のいずれかでないと登録できない" do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name only hiragana and kana and kanji")
      end
      it "last_nameが全角かつひらがな、カナ、漢字のいずれかでないと登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name only hiragana and kana and kanji")
      end
      it "first_name_readingが全角のカナでないと登録できない" do
        @user.first_name_reading = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading only kanamoji")
      end
      it "last_name_readingが全角のカナでないと登録できない" do
        @user.last_name_reading = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading only kanamoji")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end