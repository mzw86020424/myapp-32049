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
      it "USERが紐づいていないと登録できない" do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include "User must exist"
      end
      it "ZINEが紐づいていないと登録できない" do
        @post.zine = nil
        @post.valid?
        expect(@post.errors.full_messages).to include "Zine must exist"
      end
    end
  end
end