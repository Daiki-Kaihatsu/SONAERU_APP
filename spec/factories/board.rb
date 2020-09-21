FactoryBot.define do
  # テスト用の投稿の作成
  # テスト投稿1
  factory :board do
    user
    sequence(:title) { |n| "TEST_TITLE#{n}" }
    reason {"テスト投稿1用のためです"}
    point {"Rspecの試験です"}
  end     
  
  # # テスト投稿2
  # factory :Otherboard, class: Board do
  #   title {"TEST_TITLE2"}
  #   reason {"テスト投稿2用のためです"}
  #   point {"Rspecの試験です"}
  # end  
end


