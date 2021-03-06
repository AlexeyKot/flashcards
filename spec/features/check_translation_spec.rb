require 'rails_helper'

feature "Check translation", type: :feature do
  let!(:user) { User.create(email: "example@local.host", password: "12345678" )}
  let!(:card) { Card.create(original_text: "hat", translated_text: "шапка", review_date: (Date.today - 3.days), user: user) }
  scenario "successfully" do
    visit root_path
    fill_in "check_answer", with: "hat"
    click_on "Проверить"

    expect(page).to have_content "Правильный ответ"
  end

  scenario "fail" do
    visit root_path
    fill_in "check_answer", with: "hut"
    click_on "Проверить"

    expect(page).to have_content "неправильно"
  end
end
