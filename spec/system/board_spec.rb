require 'rails_helper'

RSpec.feature '新規投稿テスト', type: :system do
  background do
    @user = create(:user)
    @other_user = create(:OtherUser)
    @positive = create(:pcrpositive)
    @pcrtest = create(:pcrtested)
    @recovery = create_list(:recovery, 2)
  end

scenario '新規投稿ページでタイトルが20文字以上だったらエラーになる' do
  # ログイン処理
  visit root_path
  click_link 'ログイン'
  fill_in "user[name]", with: "TEST_NAME1"
  fill_in "user[password]", with: "foobar"
  click_on "サインイン"
  expect(page).to have_content "ログインしました。"
  # 新規投稿リンクをクリック
  click_link '新規投稿'
  # タイトルタグがある事を確認する
  expect(page).to have_content "タイトル"
  # タイトルに21文字以上入力する
  fill_in "board[title]", with: "abcdefghijklmnopqrstu"
  # 登録するボタンんをクリック
  click_on "登録する"
  # エラーメッセージが出る事を検証する
  expect(page).to have_content "投稿に失敗しました"
  end
end