require 'rails_helper'

RSpec.feature 'TopPage', type: :system do
  background do
    @user = create(:user)
    @other_user = create(:OtherUser)
    @positive = create(:pcrpositive)
    @pcrtest = create(:pcrtested)
    @recovery = create_list(:recovery, 2)
  end


  scenario 'トップ画面→ログイン→ユーザー一覧→マイページに遷移' do
    # ログイン処理
    visit root_path
    click_link 'ログイン'
    fill_in "user[name]", with: "TEST_NAME1"
    fill_in "user[password]", with: "foobar"
    click_on "サインイン"
    expect(page).to have_content "ログインしました。"
    # ユーザー一覧リンクをクリック
    click_link 'ユーザー一覧'
    # ユーザー一覧ページに遷移したことを検証する
    expect(page).to have_content "TEST_NAME1"
    expect(page).to have_content "TEST_NAME2"
    # マイページに遷移
    click_link 'TEST_NAME1'
    # # マイページに遷移したことを検証する
    expect(page).to have_content "TEST_NAME1"
  end


  scenario 'トップ画面→新型コロナ感染状況のページに遷移' do
    # トップページを開く
    visit root_path
    # 新型コロナ最新状況のリンクをクリック
    click_link '新型コロナ感染状況'
    # ページ遷移したことを確認する
    expect(page).to have_content '新型コロナ最新情報'
  end
end
