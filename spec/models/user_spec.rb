require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "新規登録" do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nickenameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠が含まれていないと登録できない" do
        @user.email = "aaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordでは数字だけでは登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordでは英語だけでは登録できないこと" do
        @user.password = "testtest"
        @user.password_confirmation = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordでは記号が含まれているものは登録できないこと" do
        @user.password = "testtest!"
        @user.password_confirmation = "testtest!"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが異なる場合登録できないこと" do
        @user.password_confirmation = "test000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空では登録できないこと" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが空では登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_nameでは英語が登録できないこと" do
        @user.family_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "family_nameでは数字が含まれているものは登録できないこと" do
        @user.family_name = "テスト1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "family_nameでは記号が含まれているものは登録できないこと" do
        @user.family_name = "テスト!"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameでは英語が登録できないこと" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_nameでは数字が含まれているものは登録できないこと" do
        @user.first_name = "テスト1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_nameでは記号が含まれているものは登録できないこと" do
        @user.first_name = "テスト!"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "family_name_readingが空では登録できないこと" do
        @user.family_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end
      it "first_name_readingが空では登録できないこと" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "family_name_readingでは漢字が登録できないこと" do
        @user.family_name_reading = "試験"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end
      it "family_name_readingではひらがなが登録できないこと" do
        @user.family_name_reading = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end
      it "family_name_readingでは英語が登録できないこと" do
        @user.family_name_reading = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end
      it "family_name_readingでは数字が含まれているものは登録できないこと" do
        @user.family_name_reading = "テスト1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end
      it "family_name_readingでは記号が含まれているものは登録できないこと" do
        @user.family_name_reading = "テスト!"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end
      it "first_name_readingでは漢字が登録できないこと" do
        @user.first_name_reading = "試験"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "first_name_readingではひらがなが登録できないこと" do
        @user.first_name_reading = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "first_name_readingでは英語が登録できないこと" do
        @user.first_name_reading = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "first_name_readingでは数字が含まれているものは登録できないこと" do
        @user.first_name_reading = "テスト1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "first_name_readingでは記号が含まれているものは登録できないこと" do
        @user.first_name_reading = "テスト!"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "birthdayが空では登録できないこと" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
