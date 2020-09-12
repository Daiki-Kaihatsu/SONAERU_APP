require 'rails_helper'

RSpec.feature 'TopPage', type: :system do
  background do
    @user1 = create(:user)
    @user2 = create(:user)
    @positive = create(:pcrpositive)
    @pcrtest = create(:pcrtested)
    @recovery = create_list(:recovery, 2)
  end

  scenario 'ログイン処理を行いサインインページに遷移する' do
    # トップページを開く
    visit root_path
    # ログインリンクをクリックする
    click_link 'ログイン'
    # ログインフォームを入力する
    fill_in "user[name]", with: "TEST_NAME2"
    fill_in "user[password]", with: "foobar"
    # ログインボタンをクリック
    click_on "サインイン"
    # ログインに成功したことを検証する
    expect(page).to have_content 'ログインしました。'
    # マイページに遷移
    click_link "マイページ"
    expect(page).to have_content 'TEST_NAME2'
  end

  scenario 'トップ画面から新規登録を行いテストログイン処理を行う' do
    # トップページを開く
    visit new_user_registration_path
    # 新規登録フォームを入力する
    fill_in "user[name]", with: "細井大輝"
    fill_in "user[email]", with: "test1000@example.com"
    fill_in "user[password]", with: "foobar"
    fill_in "user[password_confirmation]", with: "foobar"
    # サインインボタンをクリックする
    click_on "アカウント登録"
    # 新規登録に成功したことを検証する
    expect(page).to have_content 'アカウント登録が完了しました。'
    # ログアウト処理を行う
    click_link 'ログアウト'
    # テストログイン処理を行う
    click_link 'テストログイン'
    # ログインに成功した事を検証する
    expect(page).to have_content 'ゲストユーザとしてログインしました'    
  end
end