require 'rails_helper'

RSpec.describe 'URL投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post_url = Faker::Internet.url
  end
  context 'URL投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('input[name="commit"]').click
    expect(page).to have_content("ようこそ")
    # フォームに情報を入力する
    fill_in 'url', with: @post_url
    # 送信するとPostモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Post.count }.by(1)
    # トップページに先ほど投稿したURLのポストが存在することを確認する
    expect(page).to have_selector 'a', class: "link"
    end
  end
  context 'URL投稿ができないとき'do
    it 'ログインしていないと新規投稿できない' do
      # users'保存されているユーザーの情報と合致しないとログインができない'と同じ
    end
  end
end