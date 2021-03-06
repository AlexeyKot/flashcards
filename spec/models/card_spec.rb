require 'rails_helper'

describe Card, type: :model do

	it { should belong_to :user }

	it "shouldn't contain same pair of words" do
		card = Card.create(original_text: "Cat ", translated_text: "  cat")
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
