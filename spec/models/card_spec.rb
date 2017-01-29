require 'rails_helper'

describe Card do
    it { should validate_presence_of(:original_text) }
    it { should validate_presence_of(:translated_text) }
    it { should validate_uniqueness_of(:original_text) }
    
end