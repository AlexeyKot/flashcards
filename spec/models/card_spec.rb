require 'rails_helper'

describe Card, type: :model do

	it { should belong_to :user }

	it "should create card with a user" do
		user = User.create(email: "test@tester.ru", password: "123456", id: 1)
		card = Card.create(original_text: "Three", translated_text: "Три", user_id: 1)
		expect(card).to be_valid
	end

	it "should't create card without a user" do
		user = User.create(email: "test@tester.ru", password: "123456", id: nil)
		card = Card.create(original_text: "Three", translated_text: "Три")
		expect(card).to be_invalid
	end

	it "shouldn't contain same pair of words" do
		card = Card.create(original_text: "Cat ", translated_text: "  cat", user_id: 1)
		expect(card).to be_invalid
	end

	it "should move review date to 3 days" do
		subject.move_review_date
		expect(subject.review_date).to eq(Date.today + 3.days)
	end

	context	"When checking user answer" do
		subject { Card.new(original_text: "hause")}
		it { expect(subject.check_translation("battlestart")).to be false }
		it { expect(subject.check_translation("hause")).to be true }
	end
end
