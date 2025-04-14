require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,全角でlast_name,first_name,カナがあれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        # メールアドレスが一意性であること
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailは@を含まないと登録できない' do
        # メールアドレスは、@を含む必要があること。
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        # パスワードが必須であること。
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        # パスワードは、6文字以上での入力が必須であること
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'パスワードは、半角英数字混合で構成されていないと登録できない' do
        # 半角英字のみ
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password には半角の英字と数字の両方を含めて設定してください"
        # 半角数字のみ
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password には半角の英字と数字の両方を含めて設定してください"
        # 記号が混ざっている
        @user.password = 'aaa11%'
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password には半角の英字と数字の両方を含めて設定してください"
        # 全角が混ざっている
        @user.password = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には半角の英字と数字の両方を含めて設定してください"  
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        # パスワードとパスワード（確認）は、値の一致が必須であること。
        @user.password = 'pass12'
        @user.password_confirmation = 'pass34'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end

  describe '本人情報確認' do
    context '新規登録できないとき' do
      # お名前(全角)は、苗字と名前がそれぞれ必須であること。
      it 'お名前(全角)は、苗字が空であれば登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'お名前(全角)は、名前が空であれば登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。
      it '名前(全角)は半角では登録できない' do
        @user.last_name = 'aあ'
        @user.valid?
        expect(@user.errors.full_messages).to include  "Last name は、全角文字を使用してください"
      end
      it '苗字(全角)は半角では登録できない' do
        @user.first_name = 'aあ'
        @user.valid?
        expect(@user.errors.full_messages).to include  "First name は、全角文字を使用してください"
      end

      # お名前カナ(全角)は、名字と名前がそれぞれ必須であること。
      it 'お名前カナ(全角)は、苗字が空であれば登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'お名前カナ(全角)は、名前が空であれば登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
        
      # お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
      it '名前(全角)は半角では登録できない' do
        @user.last_name_kana = 'aあ'
        @user.valid?
        expect(@user.errors.full_messages).to include  "Last name kana は、全角カナを使用してください"
      end
      it '苗字(全角)は半角では登録できない' do
        @user.first_name_kana = 'aあ'
        @user.valid?
        expect(@user.errors.full_messages).to include  "First name kana は、全角カナを使用してください"
      end

      # 生年月日が必須であること。
      it '生年月日が空であれば登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end
