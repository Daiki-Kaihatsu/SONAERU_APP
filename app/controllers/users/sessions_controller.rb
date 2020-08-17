class Users::SessionsController < Devise::SessionsController
  # ①ゲストユーザをDBから取り出す
  # ②存在しなければ、ゲストユーザを作成する
  # ③パスワードはランダムに指定する
  # ④sign_in user でログイン
  # ⑤redirect_toでルートに画面遷移
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザとしてログインしました'
  end
end 