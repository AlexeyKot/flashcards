require 'rails_helper'

describe Card do
    context "Check validators" do
        it { should validate_presence_of(:original_text) }
        it { should validate_presence_of(:translated_text) }
        it { should validate_uniqueness_of(:original_text) }
        it { should ensure_length_of(:original_text).is_at_least(2) }
        it { should ensure_length_of(:translated_text).is_at_least(2) }
    end

    
end