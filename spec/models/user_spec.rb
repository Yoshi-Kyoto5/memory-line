require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nickname, email, password, password_confirmationが全て存在すれば登録可能
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nickname＝空＝登録不可
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. email＝空＝登録不可
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. password＝空＝登録不可
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordあり＝password_confirmation＝空＝登録不可
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 6. nickname＝9文字以上＝登録不可
    it "is invalid without a nickname that has more than 9 characters" do
      user = build(:user, nickname: "aaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 8 characters)")
    end

    # 7. nickname＝8文字以下＝登録可能
    it "is valid with a nickname that has less than 8 characters" do
      user = build(:user, nickname: "aaaaaaaa")
      expect(user).to be_valid
    end

    # 8. email重複＝登録不可
    it " is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 9. password=６文字以上＝登録可能
    it " is valid with a password that has more than 6 characters" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    # 10. password=５文字以下＝登録不可
    it " is invalid with a password that has less than 5 characters" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end