require 'rails_helper'

feature 'message', type: :feature do
  let(:user) { create(:user) }

  scenario 'post message' do
    # ログイン前＝New-Postボタンが表示されない
    visit root_path
    expect(page).to have_no_content('New-Post')

    # ログイン後＝New-Postボタンが表示される
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on("Log in")
    expect(current_path).to eq root_path
    expect(page).to have_content('New-Post')

    # New-Postボタンから投稿
    expect {
      click_on('New-Post')
      expect(current_path).to eq new_message_path
      fill_in 'image', with: 'https://s.eximg.jp/expub/feed/Papimami/2016/Papimami_83279/Papimami_83279_1.png'
      fill_in 'text', with: 'フィーチャスペックのテスト'
      click_on("New-Post")
    }.to change{ Message.count}.by(0)
  end
end