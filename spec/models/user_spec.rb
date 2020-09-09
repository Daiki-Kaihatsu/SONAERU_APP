require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = build(:user)
  end

  describe 'Userモデルのバリデーション' do

    context 'バリデーションOK' do
      it 'nameとemailとpasswordとpassword_confirmationが設定されていれば、OK' do
        expect(@user.valid?).to eq(true)
      end
    end

    context 'バリデーションNG' do
      it 'nameが空だとNG' do
        @user.name = ''
        expect(@user.valid?).to eq(false)
      end

      it 'emailが空だとNG' do
        @user.email = ''
        expect(@user.valid?).to eq(false)
      end

      it 'passwordが空だとNG' do
        @user.password = ''
        expect(@user.valid?).to eq(false)
      end

      it 'password_confirmationが空だとNG' do
        @user.password_confirmation = ''
        expect(@user.valid?).to eq(false)
      end
    end

  end

end

