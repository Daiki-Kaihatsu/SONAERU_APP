


FactoryBot.define do
  # テスト用のユーザ作成
  # テストユーザー1
  factory :user do
    name {"TEST_NAME1"}
    email {"TEST1@example.com"}
    password {"foobar"}
    password_confirmation {"foobar"}
    
  end
    
    # テストユーザー2
    factory :OtherUser, class: User do
      name {"TEST_NAME2"}
      email {"TEST2@example.com"}
      password {"foobar"}
      password_confirmation {"foobar"}
  end
end



