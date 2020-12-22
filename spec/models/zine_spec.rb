require 'rails_helper'
describe Zine do
  before do
    @zine = FactoryBot.build(:zine)
  end

  describe '新規SCRAP作成' do
    context '新規作成がうまくいくとき' do
      it "year、month、userが存在すれば登録できる" do
        expect(@zine).to be_valid
      end
    end

    context '新規作成がうまくいかないとき' do
      it "yearが空だと登録できない" do
        @zine.year = ""
        @zine.valid?
        expect(@zine.errors.full_messages).to include "Year can't be blank"
      end
      it "monthが空だと登録できない" do
        @zine.month = ""
        @zine.valid?
        expect(@zine.errors.full_messages).to include "Month can't be blank"
      end
      it "USERが紐づいていないと登録できない" do
        @zine.user = nil
        @zine.valid?
        expect(@zine.errors.full_messages).to include "User must exist"
      end

    end
  end
end