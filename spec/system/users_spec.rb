require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # 未ログインユーザーだとログインページへ移動する
      expect(current_path).to eq new_user_session_path
      # 新規登録ページへのリンクをクリックする
      find('a[class="btn"]').click
      # 新規登録ページへ遷移したことを確認する
      expect(current_path).to eq new_user_registration_path
      # ユーザー情報を入力する
      attach_file "user_image", 'public/images/test_image.png'
      fill_in 'user_nickname', with: @user.nickname
      fill_in 'user_email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[class="btn"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(page).to have_content("ようこそ")
      # アイコン画像をクリックしてプルダウンメニューを表示する
        find('img[class="header-avatar rounded-circle"]').click
      #　ログアウトの項目があることを確認する
      expect(page).to have_content("ログアウト") 
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # 未ログインユーザーだとログインページへ移動する
      expect(current_path).to eq new_user_session_path
      # 新規登録ページへのリンクをクリックする
      find('a[class="btn"]').click
      # 新規登録ページへ遷移したことを確認する
      expect(current_path).to eq new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user_nickname', with: ''
      fill_in 'user_email', with: ''
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: ''
      # サインアップボタンを押してもユーザーモデルのカウントが上がらないことを確認する
      expect{
        find('input[class="btn"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(page).to have_content("Create Account") 
    end
  end
end