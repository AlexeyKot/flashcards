require 'rails_helper'
require 'helpers/login_helper.rb'

feature "Check translation", type: :feature do
  let!(:user) { User.create(email: "example@local.host", password: "12345678")}
  let!(:card) { Card.create(original_text: "hat", translated_text: "шапка", review_date: (Date.today - 3.days), user: user) }

  scenario "successfully" do
    login_user(user.email, user.password)
    visit root_path
    fill_in "check_answer", with: "hat"
    click_on "Проверить"

    expect(page).to have_content "Правильный ответ"
  end

  scenario "fail" do
    login_user(user.email, user.password)
    visit root_path
    fill_in "check_answer", with: "hut"
    click_on "Проверить"

    expect(page).to have_content "неправильно"
  end
end
