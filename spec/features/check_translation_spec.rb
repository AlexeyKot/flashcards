require 'rails_helper'

feature "User checks translation", :type => :feature do
  let!(:card) { create(:card, original_text: "шапка", translated_text: "hat", review_date: (Date.today - 3.days))}
  scenario "successfully" do
    visit root_path
    fill_in "Answer", with: "hat"
    click_on "Проверить"

    expect(page).to have_content "Правильный ответ"
  end
end
