FactoryBot.define do
  factory :user do
    # テスト用のユーザ作成
    # テストユーザー1
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    password {"foobar"}
    password_confirmation {"foobar"}
  end
end

