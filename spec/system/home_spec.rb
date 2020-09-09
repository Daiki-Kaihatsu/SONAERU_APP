require 'rails_helper'

RSpec.feature 'TopPage', type: :system do
  background do
    # ユーザを作成する
    @user = create(:user)
  end

  scenario 'ログインする' do
    # トップページを開く
    visit root_path
    # ログインボタンをクリック
    click_link 'ログイン'
    # ログインフォームに名前とパスワードを入力する
    fill_in 'name', with: '細井大輝'
    fill_in 'password', with: 'foobar'
    # サインインボタンをクリックする
    click_on 'サインイン'
    # ログインに成功したことを検証する
    expect(page).to have_content 'ログインしました。'
  end
end