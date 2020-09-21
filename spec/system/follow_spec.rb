require 'rails_helper'

RSpec.feature 'follow', type: :system do
  let(:user) { create(:user) }
  let(:board) { create(:board, user: user) }
  background do
    @user = create(:user)
    @other_user = create(:OtherUser)
    @positive = create(:pcrpositive)
    @pcrtest = create(:pcrtested)
    @recovery = create_list(:recovery, 2)
  end

  scenario 'ログイン→ユーザー一覧→マイページ→フォロー→フォロワーページ→フォロー解除' do
    # ログイン処理
    visit root_path
    click_link 'ログイン'
    fill_in "user[name]", with: "TEST_NAME1"
    fill_in "user[password]", with: "foobar"
    click_on "サインイン"
    # ユーザー一覧リンクをクリック
    click_link 'ユーザー一覧'
    # マイページに遷移
    click_link 'TEST_NAME2'
    # フォローするボタンをクリック
    click_on 'フォローする'
    # フォローがされた事を検証
    expect(page).to have_content 'ユーザーをフォローしました'
    # フォロワーリンクをクリック
    click_link 'フォロワー1'
    # TEST_NAME1の名前がある事を検証
    expect(page).to have_content 'TEST_NAME1'
    # マイページに遷移
    visit user_path(@other_user)
    # フォロー解除
    click_on 'フォロー解除'
    # フォロー解除された事を検証する
    expect(page).to have_content 'ユーザーのフォローを解除しました'
    
  end

end
