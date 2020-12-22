require 'rails_helper'
describe Post do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'URL新規投稿' do
    context '新規投稿がうまくいくとき' do
      it "URL、year、monthが存在すれば登録できる" do
        expect(@post).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "URLが空だと登録できない" do
        @post.url = ""
        @post.valid?
        expect(@post.errors.full_messages).to include "Url can't be blank"
      end
      it "登録済みのURLは登録できない" do
        @post2 = FactoryBot.build(:post)
        @post2.save
        @post.url = @post2.url
        @post.valid?
        expect(@post.errors.full_messages).to include "Url has already been taken"
      end
      it "yearが空だと登録できない" do
        @post.year = ""
        @post.valid?
        expect(@post.errors.full_messages).to include "Year can't be blank"
      end
      it "monthが空だと登録できない" do
        @post.month = ""
        @post.valid?
        expect(@post.errors.full_messages).to include "Month can't be blank"
      end
      it "USERが紐づいていないと登録できない" do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include "User must exist"
      end
    end
  end
end