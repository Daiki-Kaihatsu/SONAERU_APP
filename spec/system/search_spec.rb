# require 'rails_helper'


# RSpec.feature '検索フォームテスト', type: :system do
#   background do
#     # @user = create(:user)
#     # other_user = create(:other_user)
#     @positive = create(:pcrpositive)
#     @pcrtest = create(:pcrtested)
#     @recovery = create_list(:recovery, 2)
#     @board = create(:board)
#     @other_board = create(:board)
#     # @other_board = create(:Otherboard)
#   end

#   scenario '検索フォームで検索ができることの検証' do
#     # ログイン処理
#     visit root_path
#     click_link 'ログイン'
#     fill_in "user[name]", with: "TEST_NAME1"
#     fill_in "user[password]", with: "foobar"
#     click_on "サインイン"
#     expect(page).to have_content "ログインしました。"
#     # 投稿一覧リンクをクリック
#     click_link '投稿一覧'
#     # 1件目の投稿が表示されていること
#     expect(page).to have_content "TEST_TITLE1"
#     # 2件目の投稿が表示されていること
#     expect(page).to have_content "TEST_TITLE2"
    
#   end
# end