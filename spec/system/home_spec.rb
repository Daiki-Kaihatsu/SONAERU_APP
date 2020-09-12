require 'rails_helper'

RSpec.feature 'TopPage', type: :system do
  background do
    @positive = create(:pcrpositive)
    @pcrtest = create(:pcrtested)
    @recovery = create_list(:recovery, 2)
  end

  scenario 'トップ画面から新型コロナ感染状況のページに遷移する' do
    # トップページを開く
    visit root_path
    # 新型コロナ最新状況のリンクをクリック
    click_link '新型コロナ感染状況'
    # ページ遷移したことを確認する
    expect(page).to have_content '新型コロナ最新情報'
  end
end


ログイン処理を行う