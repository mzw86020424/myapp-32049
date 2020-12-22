require 'rails_helper'
describe Post do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'URL新規投稿' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、画像、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@post).to be_valid
      end
      it "nicknameが6文字以下で登録できる" do
        @post.nickname = '12345'
        expect(@post).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @post.password = '123456'
        @post.password_confirmation = "123456"
        expect(@post).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @post.nickname = ""
        @post.valid?
        expect(@post.errors.full_messages).to include "Nickname can't be blank"
      end
      it "nicknameが7文字以上であれば登録できない" do
        @post.nickname = "1234567"
        @post.valid?
        expect(@post.errors.full_messages).to include "Nickname is too long (maximum is 6 characters)"
      end
      it "emailが空では登録できない" do
        @post.email = ""
        @post.valid?
        expect(@post.errors.full_messages).to include "Email can't be blank"
      end
      it "重複したemailが存在する場合登録できない" do
        @post.email = "aaa@aaa"
        @post.save
        @post2 = FactoryBot.build(:post)
        @post2.email = "aaa@aaa"
        @post2.valid?
        expect(@post2.errors.full_messages).to include "Email has already been taken"
      end
      it "passwordが空では登録できない" do
        @post.password = ""
        @post.valid?
        expect(@post.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが5文字以下であれば登録できない" do
        @post.password = "12345"
        @post.password_confirmation = "12345"
        @post.valid?
        expect(@post.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @post.password_confirmation = ""
        @post.valid?
        expect(@post.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "画像が空では登録できない" do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end